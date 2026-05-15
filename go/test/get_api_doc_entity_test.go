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

func TestGetApiDocEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.GetApiDoc(nil)
		if ent == nil {
			t.Fatal("expected non-nil GetApiDocEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := get_api_docBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"load"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "get_api_doc." + _op, _mode); _shouldSkip {
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
			t.Skip("live entity test uses synthetic IDs from fixture — set ANSWERBOOK_TEST_GET_API_DOC_ENTID JSON to run live")
			return
		}
		client := setup.client

		// Bootstrap entity data from existing test data (no create step in flow).
		getApiDocRef01DataRaw := vs.Items(core.ToMapAny(vs.GetPath("existing.get_api_doc", setup.data)))
		var getApiDocRef01Data map[string]any
		if len(getApiDocRef01DataRaw) > 0 {
			getApiDocRef01Data = core.ToMapAny(getApiDocRef01DataRaw[0][1])
		}
		// Discard guards against Go's unused-var check when the flow's steps
		// happen not to consume the bootstrap data (e.g. list-only flows).
		_ = getApiDocRef01Data

		// LOAD
		getApiDocRef01Ent := client.GetApiDoc(nil)
		getApiDocRef01MatchDt0 := map[string]any{}
		getApiDocRef01DataDt0Loaded, err := getApiDocRef01Ent.Load(getApiDocRef01MatchDt0, nil)
		if err != nil {
			t.Fatalf("load failed: %v", err)
		}
		if getApiDocRef01DataDt0Loaded == nil {
			t.Fatal("expected load result to be non-nil")
		}

	})
}

func get_api_docBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "get_api_doc", "GetApiDocTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read get_api_doc test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse get_api_doc test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"get_api_doc01", "get_api_doc02", "get_api_doc03"},
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
	entidEnvRaw := os.Getenv("ANSWERBOOK_TEST_GET_API_DOC_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"ANSWERBOOK_TEST_GET_API_DOC_ENTID": idmap,
		"ANSWERBOOK_TEST_LIVE":      "FALSE",
		"ANSWERBOOK_TEST_EXPLAIN":   "FALSE",
		"ANSWERBOOK_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["ANSWERBOOK_TEST_GET_API_DOC_ENTID"])
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
