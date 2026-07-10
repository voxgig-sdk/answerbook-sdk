// Typed models for the Answerbook SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import "encoding/json"

// BookOfAnswer is the typed data model for the book_of_answer entity.
type BookOfAnswer struct {
	Answer *string `json:"answer,omitempty"`
	AnswerI18n *map[string]any `json:"answer_i18n,omitempty"`
	Id *string `json:"id,omitempty"`
	Meta *map[string]any `json:"meta,omitempty"`
}

// BookOfAnswerLoadMatch is the typed request payload for BookOfAnswer.LoadTyped.
type BookOfAnswerLoadMatch struct {
	Answer *string `json:"answer,omitempty"`
	AnswerI18n *map[string]any `json:"answer_i18n,omitempty"`
	Id string `json:"id"`
	Meta *map[string]any `json:"meta,omitempty"`
}

// GetApiDoc is the typed data model for the get_api_doc entity.
type GetApiDoc struct {
}

// GetApiDocLoadMatch is the typed request payload for GetApiDoc.LoadTyped.
type GetApiDocLoadMatch struct {
}

// MarketData is the typed data model for the market_data entity.
type MarketData struct {
	Nasdaq100 *map[string]any `json:"nasdaq100,omitempty"`
	Sp500 *map[string]any `json:"sp500,omitempty"`
	Tw0050 *map[string]any `json:"tw0050,omitempty"`
}

// MarketDataLoadMatch is the typed request payload for MarketData.LoadTyped.
type MarketDataLoadMatch struct {
	Nasdaq100 *map[string]any `json:"nasdaq100,omitempty"`
	Sp500 *map[string]any `json:"sp500,omitempty"`
	Tw0050 *map[string]any `json:"tw0050,omitempty"`
}

// PoetryOracle is the typed data model for the poetry__oracle entity.
type PoetryOracle struct {
	Oracle *map[string]any `json:"oracle,omitempty"`
	Poem *map[string]any `json:"poem,omitempty"`
}

// PoetryOracleLoadMatch is the typed request payload for PoetryOracle.LoadTyped.
type PoetryOracleLoadMatch struct {
	Oracle *map[string]any `json:"oracle,omitempty"`
	Poem *map[string]any `json:"poem,omitempty"`
}

// Tool is the typed data model for the tool entity.
type Tool struct {
	RandomPassword *string `json:"random_password,omitempty"`
}

// ToolLoadMatch is the typed request payload for Tool.LoadTyped.
type ToolLoadMatch struct {
	RandomPassword *string `json:"random_password,omitempty"`
}

// Word is the typed data model for the word entity.
type Word struct {
	Category *string `json:"category,omitempty"`
	Definition *string `json:"definition,omitempty"`
	Word *string `json:"word,omitempty"`
}

// WordLoadMatch is the typed request payload for Word.LoadTyped.
type WordLoadMatch struct {
	Category *string `json:"category,omitempty"`
	Word *string `json:"word,omitempty"`
	Id *string `json:"id,omitempty"`
}

// WordsLearning is the typed data model for the words_learning entity.
type WordsLearning struct {
	Category *[]any `json:"category,omitempty"`
}

// WordsLearningListMatch is the typed request payload for WordsLearning.ListTyped.
type WordsLearningListMatch struct {
	Category *[]any `json:"category,omitempty"`
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

// typedFrom decodes a runtime value (a map[string]any produced by the op
// pipeline) into a typed model T via a JSON round-trip. On any error it
// returns the zero value of T; the op's own (value, error) tuple carries the
// real error.
func typedFrom[T any](v any) T {
	var out T
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

// typedSliceFrom decodes a runtime list value ([]any of maps) into a typed
// slice []T via a JSON round-trip, for list ops.
func typedSliceFrom[T any](v any) []T {
	var out []T
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
