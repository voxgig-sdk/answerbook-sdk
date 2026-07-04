# frozen_string_literal: true

# Typed models for the Answerbook SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# BookOfAnswer entity data model.
#
# @!attribute [rw] answer
#   @return [String, nil]
#
# @!attribute [rw] answer_i18n
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] meta
#   @return [Hash, nil]
BookOfAnswer = Struct.new(
  :answer,
  :answer_i18n,
  :id,
  :meta,
  keyword_init: true
)

# Match filter for BookOfAnswer#load (any subset of BookOfAnswer fields).
#
# @!attribute [rw] answer
#   @return [String, nil]
#
# @!attribute [rw] answer_i18n
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] meta
#   @return [Hash, nil]
BookOfAnswerLoadMatch = Struct.new(
  :answer,
  :answer_i18n,
  :id,
  :meta,
  keyword_init: true
)

# GetApiDoc entity data model.
class GetApiDoc
end

# Match filter for GetApiDoc#load (any subset of GetApiDoc fields).
class GetApiDocLoadMatch
end

# MarketData entity data model.
#
# @!attribute [rw] nasdaq100
#   @return [Hash, nil]
#
# @!attribute [rw] sp500
#   @return [Hash, nil]
#
# @!attribute [rw] tw0050
#   @return [Hash, nil]
MarketData = Struct.new(
  :nasdaq100,
  :sp500,
  :tw0050,
  keyword_init: true
)

# Match filter for MarketData#load (any subset of MarketData fields).
#
# @!attribute [rw] nasdaq100
#   @return [Hash, nil]
#
# @!attribute [rw] sp500
#   @return [Hash, nil]
#
# @!attribute [rw] tw0050
#   @return [Hash, nil]
MarketDataLoadMatch = Struct.new(
  :nasdaq100,
  :sp500,
  :tw0050,
  keyword_init: true
)

# PoetryOracle entity data model.
#
# @!attribute [rw] oracle
#   @return [Hash, nil]
#
# @!attribute [rw] poem
#   @return [Hash, nil]
PoetryOracle = Struct.new(
  :oracle,
  :poem,
  keyword_init: true
)

# Match filter for PoetryOracle#load (any subset of PoetryOracle fields).
#
# @!attribute [rw] oracle
#   @return [Hash, nil]
#
# @!attribute [rw] poem
#   @return [Hash, nil]
PoetryOracleLoadMatch = Struct.new(
  :oracle,
  :poem,
  keyword_init: true
)

# Tool entity data model.
#
# @!attribute [rw] random_password
#   @return [String, nil]
Tool = Struct.new(
  :random_password,
  keyword_init: true
)

# Match filter for Tool#load (any subset of Tool fields).
#
# @!attribute [rw] random_password
#   @return [String, nil]
ToolLoadMatch = Struct.new(
  :random_password,
  keyword_init: true
)

# Word entity data model.
#
# @!attribute [rw] category
#   @return [String, nil]
#
# @!attribute [rw] definition
#   @return [String, nil]
#
# @!attribute [rw] word
#   @return [String, nil]
Word = Struct.new(
  :category,
  :definition,
  :word,
  keyword_init: true
)

# Request payload for Word#load.
#
# @!attribute [rw] category
#   @return [String]
#
# @!attribute [rw] word
#   @return [String]
#
# @!attribute [rw] id
#   @return [String]
WordLoadMatch = Struct.new(
  :category,
  :word,
  :id,
  keyword_init: true
)

# WordsLearning entity data model.
#
# @!attribute [rw] category
#   @return [Array, nil]
WordsLearning = Struct.new(
  :category,
  keyword_init: true
)

# Match filter for WordsLearning#list (any subset of WordsLearning fields).
#
# @!attribute [rw] category
#   @return [Array, nil]
WordsLearningListMatch = Struct.new(
  :category,
  keyword_init: true
)

