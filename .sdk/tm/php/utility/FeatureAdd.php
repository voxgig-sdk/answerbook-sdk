<?php
declare(strict_types=1);

// Answerbook SDK utility: feature_add

class AnswerbookFeatureAdd
{
    public static function call(AnswerbookContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
