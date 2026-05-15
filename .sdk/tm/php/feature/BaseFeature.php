<?php
declare(strict_types=1);

// Answerbook SDK base feature

class AnswerbookBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(AnswerbookContext $ctx, array $options): void {}
    public function PostConstruct(AnswerbookContext $ctx): void {}
    public function PostConstructEntity(AnswerbookContext $ctx): void {}
    public function SetData(AnswerbookContext $ctx): void {}
    public function GetData(AnswerbookContext $ctx): void {}
    public function GetMatch(AnswerbookContext $ctx): void {}
    public function SetMatch(AnswerbookContext $ctx): void {}
    public function PrePoint(AnswerbookContext $ctx): void {}
    public function PreSpec(AnswerbookContext $ctx): void {}
    public function PreRequest(AnswerbookContext $ctx): void {}
    public function PreResponse(AnswerbookContext $ctx): void {}
    public function PreResult(AnswerbookContext $ctx): void {}
    public function PreDone(AnswerbookContext $ctx): void {}
    public function PreUnexpected(AnswerbookContext $ctx): void {}
}
