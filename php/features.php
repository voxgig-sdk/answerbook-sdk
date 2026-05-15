<?php
declare(strict_types=1);

// Answerbook SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class AnswerbookFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new AnswerbookBaseFeature();
            case "test":
                return new AnswerbookTestFeature();
            default:
                return new AnswerbookBaseFeature();
        }
    }
}
