// Typed models for the Answerbook SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface BookOfAnswer {
  answer?: string
  answer_i18n?: Record<string, any>
  id?: string
  meta?: Record<string, any>
}

export interface BookOfAnswerLoadMatch {
  lang?: string
  length?: string
  mood?: string
  style?: string
  theme?: string
  tone?: string
}

export interface GetApiDoc {
}

export interface GetApiDocLoadMatch {
}

export interface MarketData {
  change?: string
  percentChange?: string
  price?: string
}

export interface MarketDataLoadMatch {
  change?: string
  percentChange?: string
  price?: string
}

export interface PoetryOracle {
  author?: string
  content?: string
  interpretation?: string
  poem?: string
  title?: string
  type?: string
}

export interface PoetryOracleLoadMatch {
  author?: string
  content?: string
  interpretation?: string
  poem?: string
  title?: string
  type?: string
}

export interface Tool {
  RandomPassword?: string
}

export interface ToolLoadMatch {
  RandomPassword?: string
}

export interface Word {
  category?: string
  definition?: string
  id?: string
  word?: string
}

export interface WordLoadMatch {
  id: string
}

export interface WordsLearning {
  categories?: any[]
}

export interface WordsLearningListMatch {
  categories?: any[]
}

