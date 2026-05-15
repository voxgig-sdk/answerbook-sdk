-- ProjectName SDK configuration

local function make_config()
  return {
    main = {
      name = "Answerbook",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
      },
    },
    options = {
      base = "https://answerbook.david888.com",
      auth = {
        prefix = "Bearer",
      },
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["book_of_answer"] = {},
        ["get_api_doc"] = {},
        ["market_data"] = {},
        ["poetry__oracle"] = {},
        ["tool"] = {},
        ["word"] = {},
        ["words_learning"] = {},
      },
    },
    entity = {
      ["book_of_answer"] = {
        ["fields"] = {
          {
            ["name"] = "answer",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 0,
          },
          {
            ["name"] = "answer_i18n",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 1,
          },
          {
            ["name"] = "id",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 2,
          },
          {
            ["name"] = "meta",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 3,
          },
        },
        ["name"] = "book_of_answer",
        ["op"] = {
          ["load"] = {
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "lang",
                      ["orig"] = "lang",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "length",
                      ["orig"] = "length",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "mood",
                      ["orig"] = "mood",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "style",
                      ["orig"] = "style",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "theme",
                      ["orig"] = "theme",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "tone",
                      ["orig"] = "tone",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                  },
                },
                ["method"] = "GET",
                ["orig"] = "/answersWithMeta",
                ["parts"] = {
                  "answersWithMeta",
                },
                ["select"] = {
                  ["exist"] = {
                    "lang",
                    "length",
                    "mood",
                    "style",
                    "theme",
                    "tone",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["index$"] = 0,
              },
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["example"] = "bilingual",
                      ["kind"] = "query",
                      ["name"] = "lang",
                      ["orig"] = "lang",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                  },
                },
                ["method"] = "GET",
                ["orig"] = "/answers",
                ["parts"] = {
                  "answers",
                },
                ["select"] = {
                  ["exist"] = {
                    "lang",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["index$"] = 1,
              },
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "lang",
                      ["orig"] = "lang",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                  },
                },
                ["method"] = "GET",
                ["orig"] = "/answersOriginal",
                ["parts"] = {
                  "answersOriginal",
                },
                ["select"] = {
                  ["exist"] = {
                    "lang",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["index$"] = 2,
              },
            },
            ["input"] = "data",
            ["key$"] = "load",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["get_api_doc"] = {
        ["fields"] = {},
        ["name"] = "get_api_doc",
        ["op"] = {
          ["load"] = {
            ["name"] = "load",
            ["points"] = {
              {
                ["method"] = "GET",
                ["orig"] = "/",
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["parts"] = {},
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 0,
              },
            },
            ["input"] = "data",
            ["key$"] = "load",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["market_data"] = {
        ["fields"] = {
          {
            ["name"] = "nasdaq100",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 0,
          },
          {
            ["name"] = "sp500",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 1,
          },
          {
            ["name"] = "tw0050",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 2,
          },
        },
        ["name"] = "market_data",
        ["op"] = {
          ["load"] = {
            ["name"] = "load",
            ["points"] = {
              {
                ["method"] = "GET",
                ["orig"] = "/SP500",
                ["parts"] = {
                  "SP500",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 0,
              },
              {
                ["method"] = "GET",
                ["orig"] = "/TW0050",
                ["parts"] = {
                  "TW0050",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 1,
              },
              {
                ["method"] = "GET",
                ["orig"] = "/nasdaq100",
                ["parts"] = {
                  "nasdaq100",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 2,
              },
            },
            ["input"] = "data",
            ["key$"] = "load",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["poetry__oracle"] = {
        ["fields"] = {
          {
            ["name"] = "oracle",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 0,
          },
          {
            ["name"] = "poem",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 1,
          },
        },
        ["name"] = "poetry__oracle",
        ["op"] = {
          ["load"] = {
            ["name"] = "load",
            ["points"] = {
              {
                ["method"] = "GET",
                ["orig"] = "/TangPoetry",
                ["parts"] = {
                  "TangPoetry",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 0,
              },
              {
                ["method"] = "GET",
                ["orig"] = "/TempleOracleJP",
                ["parts"] = {
                  "TempleOracleJP",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 1,
              },
            },
            ["input"] = "data",
            ["key$"] = "load",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["tool"] = {
        ["fields"] = {
          {
            ["name"] = "random_password",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 0,
          },
        },
        ["name"] = "tool",
        ["op"] = {
          ["load"] = {
            ["name"] = "load",
            ["points"] = {
              {
                ["method"] = "GET",
                ["orig"] = "/RandomPassword",
                ["parts"] = {
                  "RandomPassword",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 0,
              },
            },
            ["input"] = "data",
            ["key$"] = "load",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["word"] = {
        ["fields"] = {
          {
            ["name"] = "category",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 0,
          },
          {
            ["name"] = "definition",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 1,
          },
          {
            ["name"] = "word",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 2,
          },
        },
        ["name"] = "word",
        ["op"] = {
          ["load"] = {
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "category",
                      ["orig"] = "category",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                    {
                      ["kind"] = "param",
                      ["name"] = "word",
                      ["orig"] = "word",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                  },
                },
                ["method"] = "GET",
                ["orig"] = "/words/{category}/{word}",
                ["parts"] = {
                  "words",
                  "{category}",
                  "{word}",
                },
                ["select"] = {
                  ["exist"] = {
                    "category",
                    "word",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["index$"] = 0,
              },
              {
                ["args"] = {
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "id",
                      ["orig"] = "category",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                  },
                },
                ["method"] = "GET",
                ["orig"] = "/words/{category}",
                ["parts"] = {
                  "words",
                  "{id}",
                },
                ["rename"] = {
                  ["param"] = {
                    ["category"] = "id",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "id",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["index$"] = 1,
              },
            },
            ["input"] = "data",
            ["key$"] = "load",
          },
        },
        ["relations"] = {
          ["ancestors"] = {
            {
              "word",
            },
          },
        },
      },
      ["words_learning"] = {
        ["fields"] = {
          {
            ["name"] = "category",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["active"] = true,
            ["index$"] = 0,
          },
        },
        ["name"] = "words_learning",
        ["op"] = {
          ["list"] = {
            ["name"] = "list",
            ["points"] = {
              {
                ["method"] = "GET",
                ["orig"] = "/words/categories",
                ["parts"] = {
                  "words",
                  "categories",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 0,
              },
            },
            ["input"] = "data",
            ["key$"] = "list",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
