<?php
declare(strict_types=1);

// Answerbook SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

AnswerbookUtility::setRegistrar(function (AnswerbookUtility $u): void {
    $u->clean = [AnswerbookClean::class, 'call'];
    $u->done = [AnswerbookDone::class, 'call'];
    $u->make_error = [AnswerbookMakeError::class, 'call'];
    $u->feature_add = [AnswerbookFeatureAdd::class, 'call'];
    $u->feature_hook = [AnswerbookFeatureHook::class, 'call'];
    $u->feature_init = [AnswerbookFeatureInit::class, 'call'];
    $u->fetcher = [AnswerbookFetcher::class, 'call'];
    $u->make_fetch_def = [AnswerbookMakeFetchDef::class, 'call'];
    $u->make_context = [AnswerbookMakeContext::class, 'call'];
    $u->make_options = [AnswerbookMakeOptions::class, 'call'];
    $u->make_request = [AnswerbookMakeRequest::class, 'call'];
    $u->make_response = [AnswerbookMakeResponse::class, 'call'];
    $u->make_result = [AnswerbookMakeResult::class, 'call'];
    $u->make_point = [AnswerbookMakePoint::class, 'call'];
    $u->make_spec = [AnswerbookMakeSpec::class, 'call'];
    $u->make_url = [AnswerbookMakeUrl::class, 'call'];
    $u->param = [AnswerbookParam::class, 'call'];
    $u->prepare_auth = [AnswerbookPrepareAuth::class, 'call'];
    $u->prepare_body = [AnswerbookPrepareBody::class, 'call'];
    $u->prepare_headers = [AnswerbookPrepareHeaders::class, 'call'];
    $u->prepare_method = [AnswerbookPrepareMethod::class, 'call'];
    $u->prepare_params = [AnswerbookPrepareParams::class, 'call'];
    $u->prepare_path = [AnswerbookPreparePath::class, 'call'];
    $u->prepare_query = [AnswerbookPrepareQuery::class, 'call'];
    $u->result_basic = [AnswerbookResultBasic::class, 'call'];
    $u->result_body = [AnswerbookResultBody::class, 'call'];
    $u->result_headers = [AnswerbookResultHeaders::class, 'call'];
    $u->transform_request = [AnswerbookTransformRequest::class, 'call'];
    $u->transform_response = [AnswerbookTransformResponse::class, 'call'];
});
