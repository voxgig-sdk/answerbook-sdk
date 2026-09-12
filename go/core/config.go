package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "Answerbook",
			"slug": "answerbook",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"transport": "base",
			},
		},
		"options": map[string]any{
			"base": "https://answerbook.david888.com",
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"book_of_answer": map[string]any{},
				"get_api_doc": map[string]any{},
				"market_data": map[string]any{},
				"poetry__oracle": map[string]any{},
				"tool": map[string]any{},
				"word": map[string]any{},
				"words_learning": map[string]any{},
			},
		},
		"entity": map[string]any{
			"book_of_answer": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "answer",
						"short": "The answer text (bilingual or single language)",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "answer_i18n",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "meta",
						"type": "`$OBJECT`",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "book_of_answer",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "lang",
											"orig": "lang",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "length",
											"orig": "length",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "mood",
											"orig": "mood",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "style",
											"orig": "style",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "theme",
											"orig": "theme",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "tone",
											"orig": "tone",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/answersWithMeta",
								"segments": []any{
									map[string]any{
										"lit": "answersWithMeta",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"lang",
										"length",
										"mood",
										"style",
										"theme",
										"tone",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"answersWithMeta",
								},
							},
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"example": "bilingual",
											"kind": "query",
											"name": "lang",
											"orig": "lang",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/answers",
								"segments": []any{
									map[string]any{
										"lit": "answers",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"lang",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"answers",
								},
							},
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "lang",
											"orig": "lang",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/answersOriginal",
								"segments": []any{
									map[string]any{
										"lit": "answersOriginal",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"lang",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"answersOriginal",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"get_api_doc": map[string]any{
				"fields": []any{},
				"name": "get_api_doc",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/",
								"segments": []any{},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"market_data": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "change",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "percentChange",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "price",
						"type": "`$STRING`",
					},
				},
				"name": "market_data",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/SP500",
								"segments": []any{
									map[string]any{
										"lit": "SP500",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.SP500`",
								},
								"parts": []any{
									"SP500",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/TW0050",
								"segments": []any{
									map[string]any{
										"lit": "TW0050",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.TW0050`",
								},
								"parts": []any{
									"TW0050",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/nasdaq100",
								"segments": []any{
									map[string]any{
										"lit": "nasdaq100",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.nasdaq100`",
								},
								"parts": []any{
									"nasdaq100",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"poetry__oracle": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "author",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "content",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "interpretation",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "poem",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "title",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "type",
						"short": "Fortune type (Great Fortune, etc.)",
						"type": "`$STRING`",
					},
				},
				"name": "poetry__oracle",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/TangPoetry",
								"segments": []any{
									map[string]any{
										"lit": "TangPoetry",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.poem`",
								},
								"parts": []any{
									"TangPoetry",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/TempleOracleJP",
								"segments": []any{
									map[string]any{
										"lit": "TempleOracleJP",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.oracle`",
								},
								"parts": []any{
									"TempleOracleJP",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"tool": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "RandomPassword",
						"type": "`$STRING`",
					},
				},
				"name": "tool",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/RandomPassword",
								"segments": []any{
									map[string]any{
										"lit": "RandomPassword",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"RandomPassword",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"word": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "category",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "definition",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "word",
						"type": "`$STRING`",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "word",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "category",
											"orig": "category",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "param",
											"name": "word",
											"orig": "word",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/words/{category}/{word}",
								"segments": []any{
									map[string]any{
										"lit": "words",
									},
									map[string]any{
										"var": "category",
									},
									map[string]any{
										"var": "word",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"category",
										"word",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"words",
									"{category}",
									"{word}",
								},
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "category",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/words/{category}",
								"rename": map[string]any{
									"param": map[string]any{
										"category": "id",
									},
								},
								"segments": []any{
									map[string]any{
										"lit": "words",
									},
									map[string]any{
										"var": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"words",
									"{id}",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{
						[]any{
							"word",
						},
					},
				},
			},
			"words_learning": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "categories",
						"type": "`$ARRAY`",
					},
				},
				"name": "words_learning",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/words/categories",
								"segments": []any{
									map[string]any{
										"lit": "words",
									},
									map[string]any{
										"lit": "categories",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.categories`",
								},
								"parts": []any{
									"words",
									"categories",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

// The plugin definitions the model selected per feature, as []any so a
// feature package can consume them without core naming its types. Empty
// when no active feature declares active plugin groups for this target.
var featurePlugins = map[string][]any{
}

// FeaturePlugins is the definitions list for one feature's chain.
func FeaturePlugins(name string) []any {
	return featurePlugins[name]
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
