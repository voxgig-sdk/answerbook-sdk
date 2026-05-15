<?php
declare(strict_types=1);

// Answerbook SDK exists test

require_once __DIR__ . '/../answerbook_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = AnswerbookSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
