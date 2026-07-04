-- Answerbook SDK

local vs = require("utility.struct.struct")
local Utility = require("core.utility_type")
local Spec = require("core.spec")
local helpers = require("core.helpers")

-- Load utility registration (populates Utility._registrar)
require("utility.register")

-- Load features
local BaseFeature = require("feature.base_feature")
local features_factory = require("features")


local AnswerbookSDK = {}
AnswerbookSDK.__index = AnswerbookSDK


local function _make_feature(name)
  local factory = features_factory[name]
  if factory ~= nil then
    return factory()
  end
  return features_factory.base()
end

AnswerbookSDK._make_feature = _make_feature


function AnswerbookSDK.new(options)
  local self = setmetatable({}, AnswerbookSDK)
  self.mode = "live"
  self.features = {}
  self.options = nil

  local utility = Utility.new()
  self._utility = utility

  local config = require("config")()

  self._rootctx = utility.make_context({
    client = self,
    utility = utility,
    config = config,
    options = options or {},
    shared = {},
  }, nil)

  self.options = utility.make_options(self._rootctx)

  if vs.getpath(self.options, "feature.test.active") == true then
    self.mode = "test"
  end

  self._rootctx.options = self.options

  -- Add features from config.
  local feature_opts = helpers.to_map(vs.getprop(self.options, "feature"))
  if feature_opts ~= nil then
    local feature_items = vs.items(feature_opts)
    if feature_items ~= nil then
      for _, item in ipairs(feature_items) do
        local fname = item[1]
        local fopts = helpers.to_map(item[2])
        if fopts ~= nil and fopts["active"] == true then
          utility.feature_add(self._rootctx, _make_feature(fname))
        end
      end
    end
  end

  -- Add extension features.
  local extend = vs.getprop(self.options, "extend")
  if type(extend) == "table" then
    for _, f in ipairs(extend) do
      if type(f) == "table" and type(f.get_name) == "function" then
        utility.feature_add(self._rootctx, f)
      end
    end
  end

  -- Initialize features.
  for _, f in ipairs(self.features) do
    utility.feature_init(self._rootctx, f)
  end

  utility.feature_hook(self._rootctx, "PostConstruct")

  -- #BuildFeatures

  return self
end


function AnswerbookSDK:options_map()
  local out = vs.clone(self.options)
  if type(out) == "table" then
    return out
  end
  return {}
end


function AnswerbookSDK:get_utility()
  return Utility.copy(self._utility)
end


function AnswerbookSDK:get_root_ctx()
  return self._rootctx
end


function AnswerbookSDK:prepare(fetchargs)
  local utility = self._utility

  fetchargs = fetchargs or {}

  local ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl")) or {}

  local ctx = utility.make_context({
    opname = "prepare",
    ctrl = ctrl,
  }, self._rootctx)

  local options = self.options

  local path = vs.getprop(fetchargs, "path") or ""
  if type(path) ~= "string" then path = "" end

  local method = vs.getprop(fetchargs, "method") or "GET"
  if type(method) ~= "string" then method = "GET" end

  local params = helpers.to_map(vs.getprop(fetchargs, "params")) or {}
  local query = helpers.to_map(vs.getprop(fetchargs, "query")) or {}

  local headers = utility.prepare_headers(ctx)

  local base = vs.getprop(options, "base") or ""
  if type(base) ~= "string" then base = "" end
  local prefix = vs.getprop(options, "prefix") or ""
  if type(prefix) ~= "string" then prefix = "" end
  local suffix = vs.getprop(options, "suffix") or ""
  if type(suffix) ~= "string" then suffix = "" end

  ctx.spec = Spec.new({
    base = base,
    prefix = prefix,
    suffix = suffix,
    path = path,
    method = method,
    params = params,
    query = query,
    headers = headers,
    body = vs.getprop(fetchargs, "body"),
    step = "start",
  })

  -- Merge user-provided headers.
  local uh = vs.getprop(fetchargs, "headers")
  if type(uh) == "table" then
    for k, v in pairs(uh) do
      ctx.spec.headers[k] = v
    end
  end

  local _, err = utility.prepare_auth(ctx)
  if err ~= nil then
    return nil, err
  end

  return utility.make_fetch_def(ctx)
end


function AnswerbookSDK:direct(fetchargs)
  local utility = self._utility

  local fetchdef, err = self:prepare(fetchargs)
  if err ~= nil then
    return { ok = false, err = err }, nil
  end

  fetchargs = fetchargs or {}
  local ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl")) or {}

  local ctx = utility.make_context({
    opname = "direct",
    ctrl = ctrl,
  }, self._rootctx)

  local url = fetchdef["url"] or ""
  local fetched, fetch_err = utility.fetcher(ctx, url, fetchdef)

  if fetch_err ~= nil then
    return { ok = false, err = fetch_err }, nil
  end

  if fetched == nil then
    return {
      ok = false,
      err = ctx:make_error("direct_no_response", "response: undefined"),
    }, nil
  end

  if type(fetched) == "table" then
    local status = helpers.to_int(vs.getprop(fetched, "status"))
    local headers = vs.getprop(fetched, "headers") or {}

    -- No-body responses (204, 304) and explicit zero content-length
    -- must skip JSON parsing — calling json() on an empty body errors.
    local content_length = nil
    if type(headers) == "table" then
      content_length = headers["content-length"]
    end
    local no_body = status == 204 or status == 304 or tostring(content_length) == "0"

    local json_data = nil
    if not no_body then
      local jf = vs.getprop(fetched, "json")
      if type(jf) == "function" then
        local ok, result = pcall(jf)
        if ok then
          json_data = result
        end
        -- Non-JSON body: json_data stays nil, status/headers preserved.
      end
    end

    return {
      ok = status >= 200 and status < 300,
      status = status,
      headers = headers,
      data = json_data,
    }, nil
  end

  return {
    ok = false,
    err = ctx:make_error("direct_invalid", "invalid response type"),
  }, nil
end



-- Idiomatic facade: client:book_of_answer():list() / client:book_of_answer():load({ id = ... })
function AnswerbookSDK:book_of_answer(data)
  local EntityMod = require("entity.book_of_answer_entity")
  if data == nil then
    if self._book_of_answer == nil then
      self._book_of_answer = EntityMod.new(self, nil)
    end
    return self._book_of_answer
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:book_of_answer() instead.
function AnswerbookSDK:BookOfAnswer(data)
  local EntityMod = require("entity.book_of_answer_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:get_api_doc():list() / client:get_api_doc():load({ id = ... })
function AnswerbookSDK:get_api_doc(data)
  local EntityMod = require("entity.get_api_doc_entity")
  if data == nil then
    if self._get_api_doc == nil then
      self._get_api_doc = EntityMod.new(self, nil)
    end
    return self._get_api_doc
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:get_api_doc() instead.
function AnswerbookSDK:GetApiDoc(data)
  local EntityMod = require("entity.get_api_doc_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:market_data():list() / client:market_data():load({ id = ... })
function AnswerbookSDK:market_data(data)
  local EntityMod = require("entity.market_data_entity")
  if data == nil then
    if self._market_data == nil then
      self._market_data = EntityMod.new(self, nil)
    end
    return self._market_data
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:market_data() instead.
function AnswerbookSDK:MarketData(data)
  local EntityMod = require("entity.market_data_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:poetry__oracle():list() / client:poetry__oracle():load({ id = ... })
function AnswerbookSDK:poetry__oracle(data)
  local EntityMod = require("entity.poetry__oracle_entity")
  if data == nil then
    if self._poetry__oracle == nil then
      self._poetry__oracle = EntityMod.new(self, nil)
    end
    return self._poetry__oracle
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:poetry__oracle() instead.
function AnswerbookSDK:PoetryOracle(data)
  local EntityMod = require("entity.poetry__oracle_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:tool():list() / client:tool():load({ id = ... })
function AnswerbookSDK:tool(data)
  local EntityMod = require("entity.tool_entity")
  if data == nil then
    if self._tool == nil then
      self._tool = EntityMod.new(self, nil)
    end
    return self._tool
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:tool() instead.
function AnswerbookSDK:Tool(data)
  local EntityMod = require("entity.tool_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:word():list() / client:word():load({ id = ... })
function AnswerbookSDK:word(data)
  local EntityMod = require("entity.word_entity")
  if data == nil then
    if self._word == nil then
      self._word = EntityMod.new(self, nil)
    end
    return self._word
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:word() instead.
function AnswerbookSDK:Word(data)
  local EntityMod = require("entity.word_entity")
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:words_learning():list() / client:words_learning():load({ id = ... })
function AnswerbookSDK:words_learning(data)
  local EntityMod = require("entity.words_learning_entity")
  if data == nil then
    if self._words_learning == nil then
      self._words_learning = EntityMod.new(self, nil)
    end
    return self._words_learning
  end
  return EntityMod.new(self, data)
end

-- Deprecated: use client:words_learning() instead.
function AnswerbookSDK:WordsLearning(data)
  local EntityMod = require("entity.words_learning_entity")
  return EntityMod.new(self, data)
end




function AnswerbookSDK.test(testopts, sdkopts)
  sdkopts = sdkopts or {}
  sdkopts = vs.clone(sdkopts)
  if type(sdkopts) ~= "table" then
    sdkopts = {}
  end

  testopts = testopts or {}
  testopts = vs.clone(testopts)
  if type(testopts) ~= "table" then
    testopts = {}
  end
  testopts["active"] = true

  vs.setpath(sdkopts, "feature.test", testopts)

  local sdk = AnswerbookSDK.new(sdkopts)
  sdk.mode = "test"

  return sdk
end


return AnswerbookSDK
