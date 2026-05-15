<?php
declare(strict_types=1);

// Answerbook SDK utility: result_headers

class AnswerbookResultHeaders
{
    public static function call(AnswerbookContext $ctx): ?AnswerbookResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
