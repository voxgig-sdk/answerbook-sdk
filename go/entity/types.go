// Typed models for the Answerbook SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import (
	"encoding/json"

	"github.com/voxgig-sdk/answerbook-sdk/go/core"
)

// BookOfAnswer is the typed data model for the book_of_answer entity.
type BookOfAnswer struct {
	Answer *string `json:"answer,omitempty"`
	AnswerI18n *map[string]any `json:"answer_i18n,omitempty"`
	Id *string `json:"id,omitempty"`
	Meta *map[string]any `json:"meta,omitempty"`
}

// BookOfAnswerLoadMatch is the typed request payload for BookOfAnswer.LoadTyped.
type BookOfAnswerLoadMatch struct {
	Lang *string `json:"lang,omitempty"`
	Length *string `json:"length,omitempty"`
	Mood *string `json:"mood,omitempty"`
	Style *string `json:"style,omitempty"`
	Theme *string `json:"theme,omitempty"`
	Tone *string `json:"tone,omitempty"`
}

// GetApiDoc is the typed data model for the get_api_doc entity.
type GetApiDoc struct {
}

// GetApiDocLoadMatch is the typed request payload for GetApiDoc.LoadTyped.
type GetApiDocLoadMatch struct {
}

// MarketData is the typed data model for the market_data entity.
type MarketData struct {
	Change *string `json:"change,omitempty"`
	PercentChange *string `json:"percentChange,omitempty"`
	Price *string `json:"price,omitempty"`
}

// MarketDataLoadMatch is the typed request payload for MarketData.LoadTyped.
type MarketDataLoadMatch struct {
	Change *string `json:"change,omitempty"`
	PercentChange *string `json:"percentChange,omitempty"`
	Price *string `json:"price,omitempty"`
}

// PoetryOracle is the typed data model for the poetry__oracle entity.
type PoetryOracle struct {
	Author *string `json:"author,omitempty"`
	Content *string `json:"content,omitempty"`
	Interpretation *string `json:"interpretation,omitempty"`
	Poem *string `json:"poem,omitempty"`
	Title *string `json:"title,omitempty"`
	Type *string `json:"type,omitempty"`
}

// PoetryOracleLoadMatch is the typed request payload for PoetryOracle.LoadTyped.
type PoetryOracleLoadMatch struct {
	Author *string `json:"author,omitempty"`
	Content *string `json:"content,omitempty"`
	Interpretation *string `json:"interpretation,omitempty"`
	Poem *string `json:"poem,omitempty"`
	Title *string `json:"title,omitempty"`
	Type *string `json:"type,omitempty"`
}

// Tool is the typed data model for the tool entity.
type Tool struct {
	RandomPassword *string `json:"RandomPassword,omitempty"`
}

// ToolLoadMatch is the typed request payload for Tool.LoadTyped.
type ToolLoadMatch struct {
	RandomPassword *string `json:"RandomPassword,omitempty"`
}

// Word is the typed data model for the word entity.
type Word struct {
	Category *string `json:"category,omitempty"`
	Definition *string `json:"definition,omitempty"`
	Id *string `json:"id,omitempty"`
	Word *string `json:"word,omitempty"`
}

// WordLoadMatch is the typed request payload for Word.LoadTyped.
type WordLoadMatch struct {
	Id string `json:"id"`
}

// WordsLearning is the typed data model for the words_learning entity.
type WordsLearning struct {
	Categories *[]any `json:"categories,omitempty"`
}

// WordsLearningListMatch is the typed request payload for WordsLearning.ListTyped.
type WordsLearningListMatch struct {
	Categories *[]any `json:"categories,omitempty"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// entityData unwraps an entity to its data map.
//
// Operations resolve to the ENTITY, not the raw data (see AGENTS.md), and an
// entity's fields are UNEXPORTED — marshalling one directly yields `{}`, so
// every typed accessor would silently hand back a zero-valued struct. The
// typed boundary therefore takes the data hop first.
func entityData(v any) any {
	if ent, ok := v.(core.Entity); ok {
		return ent.Data()
	}
	return v
}

// typedFrom decodes a runtime value (an entity, or the map[string]any the op
// pipeline produced) into a typed model T via a JSON round-trip. On any error
// it returns the zero value of T; the op's own (value, error) tuple carries
// the real error.
func typedFrom[T any](v any) T {
	var out T
	v = entityData(v)
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value into a typed slice []T via a
// JSON round-trip, for list ops. `list` resolves to a slice of ENTITY
// instances, so each element takes the data hop.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	if list, ok := v.([]any); ok {
		unwrapped := make([]any, 0, len(list))
		for _, item := range list {
			unwrapped = append(unwrapped, entityData(item))
		}
		v = unwrapped
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
