<?php
declare(strict_types=1);

// Answerbook SDK utility: result_body

class AnswerbookResultBody
{
    public static function call(AnswerbookContext $ctx): ?AnswerbookResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
