# Answerbook SDK configuration


# The sekreto plugin DEFINITIONS the model selected per feature, imported
# above by name from the modules the catalogue's active `plugin.def`
# entries declare. Handed to each feature (secrets builds its Sekreto
# with them): a provider kind not listed here is unknown to that SDK.
FEATURE_PLUGINS = {
}


_shared_config = None


def shared_config():
    """Return the process-wide config, built once on first use.

    The SDK reads the config on every request and never writes to it, so one
    instance is shared by every client rather than rebuilt per client.

    The returned dict is shared: treat it as read-only. Callers that need to
    mutate should use make_config, which always returns a fresh copy.
    """
    global _shared_config
    if _shared_config is None:
        _shared_config = make_config()
    return _shared_config


def make_config():
    """Build a fresh, fully materialised config dict.

    Every call rebuilds the whole structure, so prefer shared_config unless
    you need a private copy you intend to mutate.
    """
    return {
        "main": {
            "name": "Answerbook",
            "slug": "answerbook",
            "version": "0.0.1",
            "target": "py",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
        "transport": "base",
      },
        },
        "options": {
            "base": "https://answerbook.david888.com",
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
            "short": "The answer text (bilingual or single language)",
            "type": "`$STRING`",
          },
          {
            "name": "answer_i18n",
            "type": "`$OBJECT`",
          },
          {
            "name": "id",
            "type": "`$STRING`",
          },
          {
            "name": "meta",
            "type": "`$OBJECT`",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
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
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "query",
                      "name": "length",
                      "orig": "length",
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "query",
                      "name": "mood",
                      "orig": "mood",
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "query",
                      "name": "style",
                      "orig": "style",
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "query",
                      "name": "theme",
                      "orig": "theme",
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "query",
                      "name": "tone",
                      "orig": "tone",
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/answersWithMeta",
                "segments": [
                  {
                    "lit": "answersWithMeta",
                  },
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
                "parts": [
                  "answersWithMeta",
                ],
              },
              {
                "args": {
                  "query": [
                    {
                      "example": "bilingual",
                      "kind": "query",
                      "name": "lang",
                      "orig": "lang",
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/answers",
                "segments": [
                  {
                    "lit": "answers",
                  },
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
                "parts": [
                  "answers",
                ],
              },
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "lang",
                      "orig": "lang",
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/answersOriginal",
                "segments": [
                  {
                    "lit": "answersOriginal",
                  },
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
                "parts": [
                  "answersOriginal",
                ],
              },
            ],
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
                  "res": "`body`",
                },
                "parts": [],
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "market_data": {
        "fields": [
          {
            "name": "change",
            "type": "`$STRING`",
          },
          {
            "name": "percentChange",
            "type": "`$STRING`",
          },
          {
            "name": "price",
            "type": "`$STRING`",
          },
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
                    "lit": "SP500",
                  },
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.SP500`",
                },
                "parts": [
                  "SP500",
                ],
              },
              {
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/TW0050",
                "segments": [
                  {
                    "lit": "TW0050",
                  },
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.TW0050`",
                },
                "parts": [
                  "TW0050",
                ],
              },
              {
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/nasdaq100",
                "segments": [
                  {
                    "lit": "nasdaq100",
                  },
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.nasdaq100`",
                },
                "parts": [
                  "nasdaq100",
                ],
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "poetry__oracle": {
        "fields": [
          {
            "name": "author",
            "type": "`$STRING`",
          },
          {
            "name": "content",
            "type": "`$STRING`",
          },
          {
            "name": "interpretation",
            "type": "`$STRING`",
          },
          {
            "name": "poem",
            "type": "`$STRING`",
          },
          {
            "name": "title",
            "type": "`$STRING`",
          },
          {
            "name": "type",
            "short": "Fortune type (Great Fortune, etc.)",
            "type": "`$STRING`",
          },
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
                    "lit": "TangPoetry",
                  },
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.poem`",
                },
                "parts": [
                  "TangPoetry",
                ],
              },
              {
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/TempleOracleJP",
                "segments": [
                  {
                    "lit": "TempleOracleJP",
                  },
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.oracle`",
                },
                "parts": [
                  "TempleOracleJP",
                ],
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "tool": {
        "fields": [
          {
            "name": "RandomPassword",
            "type": "`$STRING`",
          },
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
                    "lit": "RandomPassword",
                  },
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "parts": [
                  "RandomPassword",
                ],
              },
            ],
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
            "type": "`$STRING`",
          },
          {
            "name": "definition",
            "type": "`$STRING`",
          },
          {
            "name": "id",
            "type": "`$STRING`",
          },
          {
            "name": "word",
            "type": "`$STRING`",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
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
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "param",
                      "name": "word",
                      "orig": "word",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/words/{category}/{word}",
                "segments": [
                  {
                    "lit": "words",
                  },
                  {
                    "var": "category",
                  },
                  {
                    "var": "word",
                  },
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
                "parts": [
                  "words",
                  "{category}",
                  "{word}",
                ],
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
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/words/{category}",
                "rename": {
                  "param": {
                    "category": "id",
                  },
                },
                "segments": [
                  {
                    "lit": "words",
                  },
                  {
                    "var": "id",
                  },
                ],
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "parts": [
                  "words",
                  "{id}",
                ],
              },
            ],
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
            "name": "categories",
            "type": "`$ARRAY`",
          },
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
                    "lit": "words",
                  },
                  {
                    "lit": "categories",
                  },
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.categories`",
                },
                "parts": [
                  "words",
                  "categories",
                ],
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
