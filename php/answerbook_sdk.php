<?php
declare(strict_types=1);

// Answerbook SDK

require_once __DIR__ . '/utility/struct/Struct.php';
require_once __DIR__ . '/core/UtilityType.php';
require_once __DIR__ . '/core/Spec.php';
require_once __DIR__ . '/core/Helpers.php';

// Load utility registration
require_once __DIR__ . '/utility/Register.php';

// Load config and features
require_once __DIR__ . '/config.php';
require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/features.php';

use Voxgig\Struct\Struct;

class AnswerbookSDK
{
    public string $mode;
    public array $features;
    public ?array $options;

    private $_utility;
    private $_rootctx;

    public function __construct(array $options = [])
    {
        $this->mode = "live";
        $this->features = [];
        $this->options = null;

        $utility = new AnswerbookUtility();
        $this->_utility = $utility;

        $config = AnswerbookConfig::make_config();

        $this->_rootctx = ($utility->make_context)([
            "client" => $this,
            "utility" => $utility,
            "config" => $config,
            "options" => $options ?? [],
            "shared" => [],
        ], null);

        $this->options = ($utility->make_options)($this->_rootctx);

        if (Struct::getpath($this->options, "feature.test.active") === true) {
            $this->mode = "test";
        }

        $this->_rootctx->options = $this->options;

        // Add features from config.
        $feature_opts = AnswerbookHelpers::to_map(Struct::getprop($this->options, "feature"));
        if ($feature_opts) {
            $items = Struct::items($feature_opts);
            if ($items) {
                foreach ($items as $item) {
                    $fname = $item[0];
                    $fopts = AnswerbookHelpers::to_map($item[1]);
                    if ($fopts && isset($fopts["active"]) && $fopts["active"] === true) {
                        ($utility->feature_add)($this->_rootctx, AnswerbookFeatures::make_feature($fname));
                    }
                }
            }
        }

        // Add extension features.
        $extend_val = Struct::getprop($this->options, "extend");
        if (is_array($extend_val)) {
            foreach ($extend_val as $f) {
                if (is_object($f) && method_exists($f, 'get_name')) {
                    ($utility->feature_add)($this->_rootctx, $f);
                }
            }
        }

        // Initialize features.
        foreach ($this->features as $f) {
            ($utility->feature_init)($this->_rootctx, $f);
        }

        ($utility->feature_hook)($this->_rootctx, "PostConstruct");
    }

    public function options_map(): array
    {
        $out = Struct::clone($this->options);
        return is_array($out) ? $out : [];
    }

    public function get_utility()
    {
        return AnswerbookUtility::copy($this->_utility);
    }

    public function get_root_ctx()
    {
        return $this->_rootctx;
    }

    public function prepare(array $fetchargs = []): mixed
    {
        $utility = $this->_utility;
        $fetchargs = $fetchargs ?? [];

        $ctrl = AnswerbookHelpers::to_map(Struct::getprop($fetchargs, "ctrl")) ?? [];

        $ctx = ($utility->make_context)([
            "opname" => "prepare",
            "ctrl" => $ctrl,
        ], $this->_rootctx);

        $opts = $this->options;
        $path = Struct::getprop($fetchargs, "path") ?? "";
        $path = is_string($path) ? $path : "";
        $method_val = Struct::getprop($fetchargs, "method") ?? "GET";
        $method_val = is_string($method_val) ? $method_val : "GET";
        $params = AnswerbookHelpers::to_map(Struct::getprop($fetchargs, "params")) ?? [];
        $query = AnswerbookHelpers::to_map(Struct::getprop($fetchargs, "query")) ?? [];
        $headers = ($utility->prepare_headers)($ctx);

        $base = Struct::getprop($opts, "base") ?? "";
        $base = is_string($base) ? $base : "";
        $prefix = Struct::getprop($opts, "prefix") ?? "";
        $prefix = is_string($prefix) ? $prefix : "";
        $suffix = Struct::getprop($opts, "suffix") ?? "";
        $suffix = is_string($suffix) ? $suffix : "";

        $ctx->spec = new AnswerbookSpec([
            "base" => $base, "prefix" => $prefix, "suffix" => $suffix,
            "path" => $path, "method" => $method_val,
            "params" => $params, "query" => $query, "headers" => $headers,
            "body" => Struct::getprop($fetchargs, "body"),
            "step" => "start",
        ]);

        // Merge user-provided headers.
        $uh = Struct::getprop($fetchargs, "headers");
        if (is_array($uh)) {
            foreach ($uh as $k => $v) {
                $ctx->spec->headers[$k] = $v;
            }
        }

        [$_, $err] = ($utility->prepare_auth)($ctx);
        if ($err) {
            return ($utility->make_error)($ctx, $err);
        }

        [$fetchdef, $fd_err] = ($utility->make_fetch_def)($ctx);
        if ($fd_err) {
            return ($utility->make_error)($ctx, $fd_err);
        }
        return $fetchdef;
    }

    public function direct(array $fetchargs = []): mixed
    {
        $utility = $this->_utility;

        // direct() is the raw-HTTP escape hatch: it never throws, it returns
        // an {ok, err, ...} dict. prepare() now raises on error, so catch it
        // and surface the failure through the dict instead.
        try {
            $fetchdef = $this->prepare($fetchargs);
        } catch (\Throwable $err) {
            return ["ok" => false, "err" => $err];
        }

        $fetchargs = $fetchargs ?? [];
        $ctrl = AnswerbookHelpers::to_map(Struct::getprop($fetchargs, "ctrl")) ?? [];

        $ctx = ($utility->make_context)([
            "opname" => "direct",
            "ctrl" => $ctrl,
        ], $this->_rootctx);

        $url = $fetchdef["url"] ?? "";
        [$fetched, $fetch_err] = ($utility->fetcher)($ctx, $url, $fetchdef);

        if ($fetch_err) {
            return ["ok" => false, "err" => $fetch_err];
        }

        if ($fetched === null) {
            return [
                "ok" => false,
                "err" => $ctx->make_error("direct_no_response", "response: undefined"),
            ];
        }

        if (is_array($fetched)) {
            $status = AnswerbookHelpers::to_int(Struct::getprop($fetched, "status"));
            $headers = Struct::getprop($fetched, "headers") ?? [];

            // No-body responses (204, 304) and explicit zero content-length
            // must skip JSON parsing — calling json() on an empty body errors.
            $content_length = is_array($headers) ? ($headers["content-length"] ?? null) : null;
            $no_body = $status === 204 || $status === 304 || (string)$content_length === "0";

            $json_data = null;
            if (!$no_body) {
                $jf = Struct::getprop($fetched, "json");
                if (is_callable($jf)) {
                    try {
                        $json_data = $jf();
                    } catch (\Throwable $e) {
                        // Non-JSON body — leave data null but keep status/ok.
                        $json_data = null;
                    }
                }
            }

            return [
                "ok" => $status >= 200 && $status < 300,
                "status" => $status,
                "headers" => Struct::getprop($fetched, "headers"),
                "data" => $json_data,
            ];
        }

        return [
            "ok" => false,
            "err" => $ctx->make_error("direct_invalid", "invalid response type"),
        ];
    }


    private $_book_of_answer = null;

    // Idiomatic facade: $client->book_of_answer()->list() / ->load(["id" => ...]).
    // Also serves the deprecated PascalCase alias BookOfAnswer() (PHP method
    // names are case-insensitive).
    public function book_of_answer($data = null)
    {
        require_once __DIR__ . '/entity/book_of_answer_entity.php';
        if ($data === null) {
            if ($this->_book_of_answer === null) {
                $this->_book_of_answer = new BookOfAnswerEntity($this, null);
            }
            return $this->_book_of_answer;
        }
        return new BookOfAnswerEntity($this, $data);
    }


    private $_get_api_doc = null;

    // Idiomatic facade: $client->get_api_doc()->list() / ->load(["id" => ...]).
    // Also serves the deprecated PascalCase alias GetApiDoc() (PHP method
    // names are case-insensitive).
    public function get_api_doc($data = null)
    {
        require_once __DIR__ . '/entity/get_api_doc_entity.php';
        if ($data === null) {
            if ($this->_get_api_doc === null) {
                $this->_get_api_doc = new GetApiDocEntity($this, null);
            }
            return $this->_get_api_doc;
        }
        return new GetApiDocEntity($this, $data);
    }


    private $_market_data = null;

    // Idiomatic facade: $client->market_data()->list() / ->load(["id" => ...]).
    // Also serves the deprecated PascalCase alias MarketData() (PHP method
    // names are case-insensitive).
    public function market_data($data = null)
    {
        require_once __DIR__ . '/entity/market_data_entity.php';
        if ($data === null) {
            if ($this->_market_data === null) {
                $this->_market_data = new MarketDataEntity($this, null);
            }
            return $this->_market_data;
        }
        return new MarketDataEntity($this, $data);
    }


    private $_poetry__oracle = null;

    // Idiomatic facade: $client->poetry__oracle()->list() / ->load(["id" => ...]).
    // Also serves the deprecated PascalCase alias PoetryOracle() (PHP method
    // names are case-insensitive).
    public function poetry__oracle($data = null)
    {
        require_once __DIR__ . '/entity/poetry__oracle_entity.php';
        if ($data === null) {
            if ($this->_poetry__oracle === null) {
                $this->_poetry__oracle = new PoetryOracleEntity($this, null);
            }
            return $this->_poetry__oracle;
        }
        return new PoetryOracleEntity($this, $data);
    }


    private $_tool = null;

    // Idiomatic facade: $client->tool()->list() / ->load(["id" => ...]).
    // Also serves the deprecated PascalCase alias Tool() (PHP method
    // names are case-insensitive).
    public function tool($data = null)
    {
        require_once __DIR__ . '/entity/tool_entity.php';
        if ($data === null) {
            if ($this->_tool === null) {
                $this->_tool = new ToolEntity($this, null);
            }
            return $this->_tool;
        }
        return new ToolEntity($this, $data);
    }


    private $_word = null;

    // Idiomatic facade: $client->word()->list() / ->load(["id" => ...]).
    // Also serves the deprecated PascalCase alias Word() (PHP method
    // names are case-insensitive).
    public function word($data = null)
    {
        require_once __DIR__ . '/entity/word_entity.php';
        if ($data === null) {
            if ($this->_word === null) {
                $this->_word = new WordEntity($this, null);
            }
            return $this->_word;
        }
        return new WordEntity($this, $data);
    }


    private $_words_learning = null;

    // Idiomatic facade: $client->words_learning()->list() / ->load(["id" => ...]).
    // Also serves the deprecated PascalCase alias WordsLearning() (PHP method
    // names are case-insensitive).
    public function words_learning($data = null)
    {
        require_once __DIR__ . '/entity/words_learning_entity.php';
        if ($data === null) {
            if ($this->_words_learning === null) {
                $this->_words_learning = new WordsLearningEntity($this, null);
            }
            return $this->_words_learning;
        }
        return new WordsLearningEntity($this, $data);
    }



    public static function test(?array $testopts = null, ?array $sdkopts = null): self
    {
        $sdkopts = $sdkopts ?? [];
        $sdkopts = Struct::clone($sdkopts);
        $sdkopts = is_array($sdkopts) ? $sdkopts : [];

        $testopts = $testopts ?? [];
        $testopts = Struct::clone($testopts);
        $testopts = is_array($testopts) ? $testopts : [];
        $testopts["active"] = true;

        if (!isset($sdkopts["feature"])) {
            $sdkopts["feature"] = [];
        }
        $sdkopts["feature"]["test"] = $testopts;

        $sdk = new AnswerbookSDK($sdkopts);
        $sdk->mode = "test";
        return $sdk;
    }
}
