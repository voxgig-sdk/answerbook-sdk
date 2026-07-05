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
  answer?: string
  answer_i18n?: Record<string, any>
  id: string
  meta?: Record<string, any>
}

export interface GetApiDoc {
}

export interface GetApiDocLoadMatch {
}

export interface MarketData {
  nasdaq100?: Record<string, any>
  sp500?: Record<string, any>
  tw0050?: Record<string, any>
}

export interface MarketDataLoadMatch {
  nasdaq100?: Record<string, any>
  sp500?: Record<string, any>
  tw0050?: Record<string, any>
}

export interface PoetryOracle {
  oracle?: Record<string, any>
  poem?: Record<string, any>
}

export interface PoetryOracleLoadMatch {
  oracle?: Record<string, any>
  poem?: Record<string, any>
}

export interface Tool {
  random_password?: string
}

export interface ToolLoadMatch {
  random_password?: string
}

export interface Word {
  category?: string
  definition?: string
  word?: string
}

export interface WordLoadMatch {
  category: string
  word: string
  id: string
}

export interface WordsLearning {
  category?: any[]
}

export interface WordsLearningListMatch {
  category?: any[]
}

