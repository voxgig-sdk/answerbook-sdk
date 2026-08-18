-- Typed models for the Answerbook SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class BookOfAnswer
---@field answer? string
---@field answer_i18n? table
---@field id? string
---@field meta? table

---@class BookOfAnswerLoadMatch
---@field answer? string
---@field answer_i18n? table
---@field id string
---@field meta? table

---@class GetApiDoc

---@class GetApiDocLoadMatch

---@class MarketData
---@field change? string
---@field percentChange? string
---@field price? string

---@class MarketDataLoadMatch
---@field change? string
---@field percentChange? string
---@field price? string

---@class PoetryOracle
---@field author? string
---@field content? string
---@field interpretation? string
---@field poem? string
---@field title? string
---@field type? string

---@class PoetryOracleLoadMatch
---@field author? string
---@field content? string
---@field interpretation? string
---@field poem? string
---@field title? string
---@field type? string

---@class Tool
---@field RandomPassword? string

---@class ToolLoadMatch
---@field RandomPassword? string

---@class Word
---@field category? string
---@field definition? string
---@field word? string

---@class WordLoadMatch
---@field id string

---@class WordsLearning
---@field categories? table

---@class WordsLearningListMatch
---@field categories? table

local M = {}

return M
