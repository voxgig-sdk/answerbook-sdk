# Answerbook SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

AnswerbookUtility.registrar = ->(u) {
  u.clean = AnswerbookUtilities::Clean
  u.done = AnswerbookUtilities::Done
  u.make_error = AnswerbookUtilities::MakeError
  u.feature_add = AnswerbookUtilities::FeatureAdd
  u.feature_hook = AnswerbookUtilities::FeatureHook
  u.feature_init = AnswerbookUtilities::FeatureInit
  u.fetcher = AnswerbookUtilities::Fetcher
  u.make_fetch_def = AnswerbookUtilities::MakeFetchDef
  u.make_context = AnswerbookUtilities::MakeContext
  u.make_options = AnswerbookUtilities::MakeOptions
  u.make_request = AnswerbookUtilities::MakeRequest
  u.make_response = AnswerbookUtilities::MakeResponse
  u.make_result = AnswerbookUtilities::MakeResult
  u.make_point = AnswerbookUtilities::MakePoint
  u.make_spec = AnswerbookUtilities::MakeSpec
  u.make_url = AnswerbookUtilities::MakeUrl
  u.param = AnswerbookUtilities::Param
  u.prepare_auth = AnswerbookUtilities::PrepareAuth
  u.prepare_body = AnswerbookUtilities::PrepareBody
  u.prepare_headers = AnswerbookUtilities::PrepareHeaders
  u.prepare_method = AnswerbookUtilities::PrepareMethod
  u.prepare_params = AnswerbookUtilities::PrepareParams
  u.prepare_path = AnswerbookUtilities::PreparePath
  u.prepare_query = AnswerbookUtilities::PrepareQuery
  u.result_basic = AnswerbookUtilities::ResultBasic
  u.result_body = AnswerbookUtilities::ResultBody
  u.result_headers = AnswerbookUtilities::ResultHeaders
  u.transform_request = AnswerbookUtilities::TransformRequest
  u.transform_response = AnswerbookUtilities::TransformResponse
}
