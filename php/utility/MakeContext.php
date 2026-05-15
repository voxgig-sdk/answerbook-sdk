<?php
declare(strict_types=1);

// Answerbook SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class AnswerbookMakeContext
{
    public static function call(array $ctxmap, ?AnswerbookContext $basectx): AnswerbookContext
    {
        return new AnswerbookContext($ctxmap, $basectx);
    }
}
