"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.FEATURE_PLUGINS = exports.config = void 0;
const TestFeature_1 = require("./feature/test/TestFeature");
const FEATURE_CLASS = {
    test: TestFeature_1.TestFeature,
};
// Per-feature plugin DEFINITIONS (voxgig/plugin `Definition` values), from
// the model's active plugin groups. A feature that takes a `plugins` option
// (secrets over sekreto) reads its own entry; a feature with no plugins has
// none. Named imports above make each definition statically reachable, so
// an SDK carries exactly the plugin modules its model selects — the same
// leanness the old side-effect registry imports bought, without a registry.
const FEATURE_PLUGINS = {};
exports.FEATURE_PLUGINS = FEATURE_PLUGINS;
class Config {
    makeFeature(fn) {
        const fc = FEATURE_CLASS[fn];
        const fi = new fc();
        // TODO: errors etc
        return fi;
    }
    // False for a feature added at runtime via options.extend (station's
    // adopt path) - the constructor uses this to skip makeFeature for names
    // no generated class backs.
    hasFeature(fn) {
        return null != FEATURE_CLASS[fn];
    }
    main = {
        name: 'Answerbook',
        slug: "answerbook",
        version: "0.0.1",
        target: "ts",
    };
    feature = {
        test: {
            "options": {
                "active": false
            },
            "transport": "base"
        },
    };
    options = {
        base: "https://answerbook.david888.com",
        headers: {
            "content-type": "application/json"
        },
        entity: {
            book_of_answer: {},
            get_api_doc: {},
            market_data: {},
            poetry__oracle: {},
            tool: {},
            word: {},
            words_learning: {},
        }
    };
    entity = {
        "book_of_answer": {
            "fields": [
                {
                    "name": "answer",
                    "short": "The answer text (bilingual or single language)",
                    "type": "`$STRING`"
                },
                {
                    "name": "answer_i18n",
                    "type": "`$OBJECT`"
                },
                {
                    "name": "id",
                    "type": "`$STRING`"
                },
                {
                    "name": "meta",
                    "type": "`$OBJECT`"
                }
            ],
            "id": {
                "field": "id",
                "name": "id"
            },
            "name": "book_of_answer",
            "op": {
                "load": {
                    "input": "data",
                    "name": "load",
                    "points": [
                        {
                            "args": {
                                "query": [
                                    {
                                        "kind": "query",
                                        "name": "lang",
                                        "orig": "lang",
                                        "type": "`$STRING`"
                                    },
                                    {
                                        "kind": "query",
                                        "name": "length",
                                        "orig": "length",
                                        "type": "`$STRING`"
                                    },
                                    {
                                        "kind": "query",
                                        "name": "mood",
                                        "orig": "mood",
                                        "type": "`$STRING`"
                                    },
                                    {
                                        "kind": "query",
                                        "name": "style",
                                        "orig": "style",
                                        "type": "`$STRING`"
                                    },
                                    {
                                        "kind": "query",
                                        "name": "theme",
                                        "orig": "theme",
                                        "type": "`$STRING`"
                                    },
                                    {
                                        "kind": "query",
                                        "name": "tone",
                                        "orig": "tone",
                                        "type": "`$STRING`"
                                    }
                                ]
                            },
                            "kind": "http",
                            "method": "GET",
                            "orig": "/answersWithMeta",
                            "segments": [
                                {
                                    "lit": "answersWithMeta"
                                }
                            ],
                            "select": {
                                "exist": [
                                    "lang",
                                    "length",
                                    "mood",
                                    "style",
                                    "theme",
                                    "tone"
                                ]
                            },
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body`"
                            },
                            "parts": [
                                "answersWithMeta"
                            ]
                        },
                        {
                            "args": {
                                "query": [
                                    {
                                        "example": "bilingual",
                                        "kind": "query",
                                        "name": "lang",
                                        "orig": "lang",
                                        "type": "`$STRING`"
                                    }
                                ]
                            },
                            "kind": "http",
                            "method": "GET",
                            "orig": "/answers",
                            "segments": [
                                {
                                    "lit": "answers"
                                }
                            ],
                            "select": {
                                "exist": [
                                    "lang"
                                ]
                            },
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body`"
                            },
                            "parts": [
                                "answers"
                            ]
                        },
                        {
                            "args": {
                                "query": [
                                    {
                                        "kind": "query",
                                        "name": "lang",
                                        "orig": "lang",
                                        "type": "`$STRING`"
                                    }
                                ]
                            },
                            "kind": "http",
                            "method": "GET",
                            "orig": "/answersOriginal",
                            "segments": [
                                {
                                    "lit": "answersOriginal"
                                }
                            ],
                            "select": {
                                "exist": [
                                    "lang"
                                ]
                            },
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body`"
                            },
                            "parts": [
                                "answersOriginal"
                            ]
                        }
                    ]
                }
            },
            "relations": {
                "ancestors": []
            }
        },
        "get_api_doc": {
            "fields": [],
            "name": "get_api_doc",
            "op": {
                "load": {
                    "input": "data",
                    "name": "load",
                    "points": [
                        {
                            "args": {},
                            "kind": "http",
                            "method": "GET",
                            "orig": "/",
                            "segments": [],
                            "select": {},
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body`"
                            },
                            "parts": []
                        }
                    ]
                }
            },
            "relations": {
                "ancestors": []
            }
        },
        "market_data": {
            "fields": [
                {
                    "name": "change",
                    "type": "`$STRING`"
                },
                {
                    "name": "percentChange",
                    "type": "`$STRING`"
                },
                {
                    "name": "price",
                    "type": "`$STRING`"
                }
            ],
            "name": "market_data",
            "op": {
                "load": {
                    "input": "data",
                    "name": "load",
                    "points": [
                        {
                            "args": {},
                            "kind": "http",
                            "method": "GET",
                            "orig": "/SP500",
                            "segments": [
                                {
                                    "lit": "SP500"
                                }
                            ],
                            "select": {},
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body.SP500`"
                            },
                            "parts": [
                                "SP500"
                            ]
                        },
                        {
                            "args": {},
                            "kind": "http",
                            "method": "GET",
                            "orig": "/TW0050",
                            "segments": [
                                {
                                    "lit": "TW0050"
                                }
                            ],
                            "select": {},
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body.TW0050`"
                            },
                            "parts": [
                                "TW0050"
                            ]
                        },
                        {
                            "args": {},
                            "kind": "http",
                            "method": "GET",
                            "orig": "/nasdaq100",
                            "segments": [
                                {
                                    "lit": "nasdaq100"
                                }
                            ],
                            "select": {},
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body.nasdaq100`"
                            },
                            "parts": [
                                "nasdaq100"
                            ]
                        }
                    ]
                }
            },
            "relations": {
                "ancestors": []
            }
        },
        "poetry__oracle": {
            "fields": [
                {
                    "name": "author",
                    "type": "`$STRING`"
                },
                {
                    "name": "content",
                    "type": "`$STRING`"
                },
                {
                    "name": "interpretation",
                    "type": "`$STRING`"
                },
                {
                    "name": "poem",
                    "type": "`$STRING`"
                },
                {
                    "name": "title",
                    "type": "`$STRING`"
                },
                {
                    "name": "type",
                    "short": "Fortune type (Great Fortune, etc.)",
                    "type": "`$STRING`"
                }
            ],
            "name": "poetry__oracle",
            "op": {
                "load": {
                    "input": "data",
                    "name": "load",
                    "points": [
                        {
                            "args": {},
                            "kind": "http",
                            "method": "GET",
                            "orig": "/TangPoetry",
                            "segments": [
                                {
                                    "lit": "TangPoetry"
                                }
                            ],
                            "select": {},
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body.poem`"
                            },
                            "parts": [
                                "TangPoetry"
                            ]
                        },
                        {
                            "args": {},
                            "kind": "http",
                            "method": "GET",
                            "orig": "/TempleOracleJP",
                            "segments": [
                                {
                                    "lit": "TempleOracleJP"
                                }
                            ],
                            "select": {},
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body.oracle`"
                            },
                            "parts": [
                                "TempleOracleJP"
                            ]
                        }
                    ]
                }
            },
            "relations": {
                "ancestors": []
            }
        },
        "tool": {
            "fields": [
                {
                    "name": "RandomPassword",
                    "type": "`$STRING`"
                }
            ],
            "name": "tool",
            "op": {
                "load": {
                    "input": "data",
                    "name": "load",
                    "points": [
                        {
                            "args": {},
                            "kind": "http",
                            "method": "GET",
                            "orig": "/RandomPassword",
                            "segments": [
                                {
                                    "lit": "RandomPassword"
                                }
                            ],
                            "select": {},
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body`"
                            },
                            "parts": [
                                "RandomPassword"
                            ]
                        }
                    ]
                }
            },
            "relations": {
                "ancestors": []
            }
        },
        "word": {
            "fields": [
                {
                    "name": "category",
                    "type": "`$STRING`"
                },
                {
                    "name": "definition",
                    "type": "`$STRING`"
                },
                {
                    "name": "id",
                    "type": "`$STRING`"
                },
                {
                    "name": "word",
                    "type": "`$STRING`"
                }
            ],
            "id": {
                "field": "id",
                "name": "id"
            },
            "name": "word",
            "op": {
                "load": {
                    "input": "data",
                    "name": "load",
                    "points": [
                        {
                            "args": {
                                "params": [
                                    {
                                        "kind": "param",
                                        "name": "category",
                                        "orig": "category",
                                        "reqd": true,
                                        "type": "`$STRING`"
                                    },
                                    {
                                        "kind": "param",
                                        "name": "word",
                                        "orig": "word",
                                        "reqd": true,
                                        "type": "`$STRING`"
                                    }
                                ]
                            },
                            "kind": "http",
                            "method": "GET",
                            "orig": "/words/{category}/{word}",
                            "segments": [
                                {
                                    "lit": "words"
                                },
                                {
                                    "var": "category"
                                },
                                {
                                    "var": "word"
                                }
                            ],
                            "select": {
                                "exist": [
                                    "category",
                                    "word"
                                ]
                            },
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body`"
                            },
                            "parts": [
                                "words",
                                "{category}",
                                "{word}"
                            ]
                        },
                        {
                            "args": {
                                "params": [
                                    {
                                        "kind": "param",
                                        "name": "id",
                                        "orig": "category",
                                        "reqd": true,
                                        "type": "`$STRING`"
                                    }
                                ]
                            },
                            "kind": "http",
                            "method": "GET",
                            "orig": "/words/{category}",
                            "rename": {
                                "param": {
                                    "category": "id"
                                }
                            },
                            "segments": [
                                {
                                    "lit": "words"
                                },
                                {
                                    "var": "id"
                                }
                            ],
                            "select": {
                                "exist": [
                                    "id"
                                ]
                            },
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body`"
                            },
                            "parts": [
                                "words",
                                "{id}"
                            ]
                        }
                    ]
                }
            },
            "relations": {
                "ancestors": [
                    [
                        "word"
                    ]
                ]
            }
        },
        "words_learning": {
            "fields": [
                {
                    "name": "categories",
                    "type": "`$ARRAY`"
                }
            ],
            "name": "words_learning",
            "op": {
                "list": {
                    "input": "data",
                    "name": "list",
                    "points": [
                        {
                            "args": {},
                            "kind": "http",
                            "method": "GET",
                            "orig": "/words/categories",
                            "segments": [
                                {
                                    "lit": "words"
                                },
                                {
                                    "lit": "categories"
                                }
                            ],
                            "select": {},
                            "transform": {
                                "req": "`reqdata`",
                                "res": "`body.categories`"
                            },
                            "parts": [
                                "words",
                                "categories"
                            ]
                        }
                    ]
                }
            },
            "relations": {
                "ancestors": []
            }
        }
    };
}
const config = new Config();
exports.config = config;
//# sourceMappingURL=Config.js.map