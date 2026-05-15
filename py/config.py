# Answerbook SDK configuration


def make_config():
    return {
        "main": {
            "name": "Answerbook",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://answerbook.david888.com",
            "auth": {
                "prefix": "Bearer",
            },
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "book_of_answer": {},
                "get_api_doc": {},
                "market_data": {},
                "poetry__oracle": {},
                "tool": {},
                "word": {},
                "words_learning": {},
            },
        },
        "entity": {
      "book_of_answer": {
        "fields": [
          {
            "name": "answer",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 0,
          },
          {
            "name": "answer_i18n",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 1,
          },
          {
            "name": "id",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 2,
          },
          {
            "name": "meta",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 3,
          },
        ],
        "name": "book_of_answer",
        "op": {
          "load": {
            "name": "load",
            "points": [
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "lang",
                      "orig": "lang",
                      "reqd": False,
                      "type": "`$STRING`",
                      "active": True,
                    },
                    {
                      "kind": "query",
                      "name": "length",
                      "orig": "length",
                      "reqd": False,
                      "type": "`$STRING`",
                      "active": True,
                    },
                    {
                      "kind": "query",
                      "name": "mood",
                      "orig": "mood",
                      "reqd": False,
                      "type": "`$STRING`",
                      "active": True,
                    },
                    {
                      "kind": "query",
                      "name": "style",
                      "orig": "style",
                      "reqd": False,
                      "type": "`$STRING`",
                      "active": True,
                    },
                    {
                      "kind": "query",
                      "name": "theme",
                      "orig": "theme",
                      "reqd": False,
                      "type": "`$STRING`",
                      "active": True,
                    },
                    {
                      "kind": "query",
                      "name": "tone",
                      "orig": "tone",
                      "reqd": False,
                      "type": "`$STRING`",
                      "active": True,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/answersWithMeta",
                "parts": [
                  "answersWithMeta",
                ],
                "select": {
                  "exist": [
                    "lang",
                    "length",
                    "mood",
                    "style",
                    "theme",
                    "tone",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 0,
              },
              {
                "args": {
                  "query": [
                    {
                      "example": "bilingual",
                      "kind": "query",
                      "name": "lang",
                      "orig": "lang",
                      "reqd": False,
                      "type": "`$STRING`",
                      "active": True,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/answers",
                "parts": [
                  "answers",
                ],
                "select": {
                  "exist": [
                    "lang",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 1,
              },
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "lang",
                      "orig": "lang",
                      "reqd": False,
                      "type": "`$STRING`",
                      "active": True,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/answersOriginal",
                "parts": [
                  "answersOriginal",
                ],
                "select": {
                  "exist": [
                    "lang",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 2,
              },
            ],
            "input": "data",
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "get_api_doc": {
        "fields": [],
        "name": "get_api_doc",
        "op": {
          "load": {
            "name": "load",
            "points": [
              {
                "method": "GET",
                "orig": "/",
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "parts": [],
                "args": {},
                "select": {},
                "index$": 0,
              },
            ],
            "input": "data",
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "market_data": {
        "fields": [
          {
            "name": "nasdaq100",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 0,
          },
          {
            "name": "sp500",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 1,
          },
          {
            "name": "tw0050",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 2,
          },
        ],
        "name": "market_data",
        "op": {
          "load": {
            "name": "load",
            "points": [
              {
                "method": "GET",
                "orig": "/SP500",
                "parts": [
                  "SP500",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 0,
              },
              {
                "method": "GET",
                "orig": "/TW0050",
                "parts": [
                  "TW0050",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 1,
              },
              {
                "method": "GET",
                "orig": "/nasdaq100",
                "parts": [
                  "nasdaq100",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 2,
              },
            ],
            "input": "data",
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "poetry__oracle": {
        "fields": [
          {
            "name": "oracle",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 0,
          },
          {
            "name": "poem",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 1,
          },
        ],
        "name": "poetry__oracle",
        "op": {
          "load": {
            "name": "load",
            "points": [
              {
                "method": "GET",
                "orig": "/TangPoetry",
                "parts": [
                  "TangPoetry",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 0,
              },
              {
                "method": "GET",
                "orig": "/TempleOracleJP",
                "parts": [
                  "TempleOracleJP",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 1,
              },
            ],
            "input": "data",
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "tool": {
        "fields": [
          {
            "name": "random_password",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 0,
          },
        ],
        "name": "tool",
        "op": {
          "load": {
            "name": "load",
            "points": [
              {
                "method": "GET",
                "orig": "/RandomPassword",
                "parts": [
                  "RandomPassword",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 0,
              },
            ],
            "input": "data",
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "word": {
        "fields": [
          {
            "name": "category",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 0,
          },
          {
            "name": "definition",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 1,
          },
          {
            "name": "word",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 2,
          },
        ],
        "name": "word",
        "op": {
          "load": {
            "name": "load",
            "points": [
              {
                "args": {
                  "params": [
                    {
                      "kind": "param",
                      "name": "category",
                      "orig": "category",
                      "reqd": True,
                      "type": "`$STRING`",
                      "active": True,
                    },
                    {
                      "kind": "param",
                      "name": "word",
                      "orig": "word",
                      "reqd": True,
                      "type": "`$STRING`",
                      "active": True,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/words/{category}/{word}",
                "parts": [
                  "words",
                  "{category}",
                  "{word}",
                ],
                "select": {
                  "exist": [
                    "category",
                    "word",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 0,
              },
              {
                "args": {
                  "params": [
                    {
                      "kind": "param",
                      "name": "id",
                      "orig": "category",
                      "reqd": True,
                      "type": "`$STRING`",
                      "active": True,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/words/{category}",
                "parts": [
                  "words",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "category": "id",
                  },
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 1,
              },
            ],
            "input": "data",
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [
            [
              "word",
            ],
          ],
        },
      },
      "words_learning": {
        "fields": [
          {
            "name": "category",
            "req": False,
            "type": "`$ARRAY`",
            "active": True,
            "index$": 0,
          },
        ],
        "name": "words_learning",
        "op": {
          "list": {
            "name": "list",
            "points": [
              {
                "method": "GET",
                "orig": "/words/categories",
                "parts": [
                  "words",
                  "categories",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 0,
              },
            ],
            "input": "data",
            "key$": "list",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
