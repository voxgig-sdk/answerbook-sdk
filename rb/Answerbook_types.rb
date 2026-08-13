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

# Request payload for BookOfAnswer#load.
#
# @!attribute [rw] answer
#   @return [String, nil]
#
# @!attribute [rw] answer_i18n
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [String]
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

# Request payload for GetApiDoc#load.
class GetApiDocLoadMatch
end

# MarketData entity data model.
#
# @!attribute [rw] change
#   @return [String, nil]
#
# @!attribute [rw] percentChange
#   @return [String, nil]
#
# @!attribute [rw] price
#   @return [String, nil]
MarketData = Struct.new(
  :change,
  :percentChange,
  :price,
  keyword_init: true
)

# Request payload for MarketData#load.
#
# @!attribute [rw] change
#   @return [String, nil]
#
# @!attribute [rw] percentChange
#   @return [String, nil]
#
# @!attribute [rw] price
#   @return [String, nil]
MarketDataLoadMatch = Struct.new(
  :change,
  :percentChange,
  :price,
  keyword_init: true
)

# PoetryOracle entity data model.
#
# @!attribute [rw] author
#   @return [String, nil]
#
# @!attribute [rw] content
#   @return [String, nil]
#
# @!attribute [rw] interpretation
#   @return [String, nil]
#
# @!attribute [rw] poem
#   @return [String, nil]
#
# @!attribute [rw] title
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
PoetryOracle = Struct.new(
  :author,
  :content,
  :interpretation,
  :poem,
  :title,
  :type,
  keyword_init: true
)

# Request payload for PoetryOracle#load.
#
# @!attribute [rw] author
#   @return [String, nil]
#
# @!attribute [rw] content
#   @return [String, nil]
#
# @!attribute [rw] interpretation
#   @return [String, nil]
#
# @!attribute [rw] poem
#   @return [String, nil]
#
# @!attribute [rw] title
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
PoetryOracleLoadMatch = Struct.new(
  :author,
  :content,
  :interpretation,
  :poem,
  :title,
  :type,
  keyword_init: true
)

# Tool entity data model.
#
# @!attribute [rw] RandomPassword
#   @return [String, nil]
Tool = Struct.new(
  :RandomPassword,
  keyword_init: true
)

# Request payload for Tool#load.
#
# @!attribute [rw] RandomPassword
#   @return [String, nil]
ToolLoadMatch = Struct.new(
  :RandomPassword,
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
#   @return [String, nil]
#
# @!attribute [rw] word
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
WordLoadMatch = Struct.new(
  :category,
  :word,
  :id,
  keyword_init: true
)

# WordsLearning entity data model.
#
# @!attribute [rw] categories
#   @return [Array, nil]
WordsLearning = Struct.new(
  :categories,
  keyword_init: true
)

# Request payload for WordsLearning#list.
#
# @!attribute [rw] categories
#   @return [Array, nil]
WordsLearningListMatch = Struct.new(
  :categories,
  keyword_init: true
)

