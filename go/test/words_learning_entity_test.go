package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/answerbook-sdk"
	"github.com/voxgig-sdk/answerbook-sdk/core"

	vs "github.com/voxgig/struct"
)

func TestWordsLearningEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.WordsLearning(nil)
		if ent == nil {
			t.Fatal("expected non-nil WordsLearningEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := words_learningBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"list"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "words_learning." + _op, _mode); _shouldSkip {
				if _reason == "" {
					_reason = "skipped via sdk-test-control.json"
				}
				t.Skip(_reason)
				return
			}
		}
		// The basic flow consumes synthetic IDs from the fixture. In live mode
		// without an *_ENTID env override, those IDs hit the live API and 4xx.
		if setup.syntheticOnly {
			t.Skip("live entity test uses synthetic IDs from fixture — set ANSWERBOOK_TEST_WORDS_LEARNING_ENTID JSON to run live")
			return
		}
		client := setup.client

		// Bootstrap entity data from existing test data (no create step in flow).
		wordsLearningRef01DataRaw := vs.Items(core.ToMapAny(vs.GetPath("existing.words_learning", setup.data)))
		var wordsLearningRef01Data map[string]any
		if len(wordsLearningRef01DataRaw) > 0 {
			wordsLearningRef01Data = core.ToMapAny(wordsLearningRef01DataRaw[0][1])
		}
		// Discard guards against Go's unused-var check when the flow's steps
		// happen not to consume the bootstrap data (e.g. list-only flows).
		_ = wordsLearningRef01Data

		// LIST
		wordsLearningRef01Ent := client.WordsLearning(nil)
		wordsLearningRef01Match := map[string]any{}

		wordsLearningRef01ListResult, err := wordsLearningRef01Ent.List(wordsLearningRef01Match, nil)
		if err != nil {
			t.Fatalf("list failed: %v", err)
		}
		_, wordsLearningRef01ListOk := wordsLearningRef01ListResult.([]any)
		if !wordsLearningRef01ListOk {
			t.Fatalf("expected list result to be an array, got %T", wordsLearningRef01ListResult)
		}

	})
}

func words_learningBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "words_learning", "WordsLearningTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read words_learning test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse words_learning test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"words_learning01", "words_learning02", "words_learning03"},
		map[string]any{
			"`$PACK`": []any{"", map[string]any{
				"`$KEY`": "`$COPY`",
				"`$VAL`": []any{"`$FORMAT`", "upper", "`$COPY`"},
			}},
		},
	)

	// Detect ENTID env override before envOverride consumes it. When live
	// mode is on without a real override, the basic test runs against synthetic
	// IDs from the fixture and 4xx's. Surface this so the test can skip.
	entidEnvRaw := os.Getenv("ANSWERBOOK_TEST_WORDS_LEARNING_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"ANSWERBOOK_TEST_WORDS_LEARNING_ENTID": idmap,
		"ANSWERBOOK_TEST_LIVE":      "FALSE",
		"ANSWERBOOK_TEST_EXPLAIN":   "FALSE",
		"ANSWERBOOK_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["ANSWERBOOK_TEST_WORDS_LEARNING_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["ANSWERBOOK_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
				"apikey": env["ANSWERBOOK_APIKEY"],
			},
			extra,
		})
		client = sdk.NewAnswerbookSDK(core.ToMapAny(mergedOpts))
	}

	live := env["ANSWERBOOK_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["ANSWERBOOK_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}
