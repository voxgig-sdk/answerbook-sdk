<?php
declare(strict_types=1);

// Answerbook SDK utility: prepare_body

class AnswerbookPrepareBody
{
    public static function call(AnswerbookContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
