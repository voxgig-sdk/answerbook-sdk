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

---@class GetApiDoc

---@class GetApiDocLoadMatch

---@class MarketData
---@field nasdaq100? table
---@field sp500? table
---@field tw0050? table

---@class MarketDataLoadMatch

---@class PoetryOracle
---@field oracle? table
---@field poem? table

---@class PoetryOracleLoadMatch

---@class Tool
---@field random_password? string

---@class ToolLoadMatch

---@class Word
---@field category? string
---@field definition? string
---@field word? string

---@class WordLoadMatch
---@field category string
---@field word string
---@field id string

---@class WordsLearning
---@field category? table

---@class WordsLearningListMatch

local M = {}

return M
