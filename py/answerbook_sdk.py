# Answerbook SDK

from utility.voxgig_struct import voxgig_struct as vs
from core.utility_type import AnswerbookUtility
from core.spec import AnswerbookSpec
from core import helpers

# Load utility registration (populates Utility._registrar)
from utility import register

# Load features
from feature.base_feature import AnswerbookBaseFeature
from features import _make_feature


class AnswerbookSDK:

    def __init__(self, options=None):
        self.mode = "live"
        self.features = []
        self.options = None

        utility = AnswerbookUtility()
        self._utility = utility

        from config import make_config
        config = make_config()

        self._rootctx = utility.make_context({
            "client": self,
            "utility": utility,
            "config": config,
            "options": options if options is not None else {},
            "shared": {},
        }, None)

        self.options = utility.make_options(self._rootctx)

        if vs.getpath(self.options, "feature.test.active") is True:
            self.mode = "test"

        self._rootctx.options = self.options

        # Add features from config.
        feature_opts = helpers.to_map(vs.getprop(self.options, "feature"))
        if feature_opts is not None:
            feature_items = vs.items(feature_opts)
            if feature_items is not None:
                for item in feature_items:
                    fname = item[0]
                    fopts = helpers.to_map(item[1])
                    if fopts is not None and fopts.get("active") is True:
                        utility.feature_add(self._rootctx, _make_feature(fname))

        # Add extension features.
        extend = vs.getprop(self.options, "extend")
        if isinstance(extend, list):
            for f in extend:
                if isinstance(f, dict) or (hasattr(f, "get_name") and callable(f.get_name)):
                    utility.feature_add(self._rootctx, f)

        # Initialize features.
        for f in self.features:
            utility.feature_init(self._rootctx, f)

        utility.feature_hook(self._rootctx, "PostConstruct")

        # #BuildFeatures

    def options_map(self):
        out = vs.clone(self.options)
        if isinstance(out, dict):
            return out
        return {}

    def get_utility(self):
        return AnswerbookUtility.copy(self._utility)

    def get_root_ctx(self):
        return self._rootctx

    def prepare(self, fetchargs=None):
        utility = self._utility

        if fetchargs is None:
            fetchargs = {}

        ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl"))
        if ctrl is None:
            ctrl = {}

        ctx = utility.make_context({
            "opname": "prepare",
            "ctrl": ctrl,
        }, self._rootctx)

        options = self.options

        path = vs.getprop(fetchargs, "path") or ""
        if not isinstance(path, str):
            path = ""

        method = vs.getprop(fetchargs, "method") or "GET"
        if not isinstance(method, str):
            method = "GET"

        params = helpers.to_map(vs.getprop(fetchargs, "params"))
        if params is None:
            params = {}
        query = helpers.to_map(vs.getprop(fetchargs, "query"))
        if query is None:
            query = {}

        headers = utility.prepare_headers(ctx)

        base = vs.getprop(options, "base") or ""
        if not isinstance(base, str):
            base = ""
        prefix = vs.getprop(options, "prefix") or ""
        if not isinstance(prefix, str):
            prefix = ""
        suffix = vs.getprop(options, "suffix") or ""
        if not isinstance(suffix, str):
            suffix = ""

        ctx.spec = AnswerbookSpec({
            "base": base,
            "prefix": prefix,
            "suffix": suffix,
            "path": path,
            "method": method,
            "params": params,
            "query": query,
            "headers": headers,
            "body": vs.getprop(fetchargs, "body"),
            "step": "start",
        })

        # Merge user-provided headers.
        uh = vs.getprop(fetchargs, "headers")
        if isinstance(uh, dict):
            for k, v in uh.items():
                ctx.spec.headers[k] = v

        _, err = utility.prepare_auth(ctx)
        if err is not None:
            raise err

        fetchdef, err = utility.make_fetch_def(ctx)
        if err is not None:
            raise err

        return fetchdef

    def direct(self, fetchargs=None):
        utility = self._utility

        try:
            fetchdef = self.prepare(fetchargs)
        except Exception as err:
            # direct() is the raw-HTTP escape hatch: it never raises, it
            # returns a result object callers branch on via result["ok"].
            return {"ok": False, "err": err}

        if fetchargs is None:
            fetchargs = {}
        ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl"))
        if ctrl is None:
            ctrl = {}

        ctx = utility.make_context({
            "opname": "direct",
            "ctrl": ctrl,
        }, self._rootctx)

        url = fetchdef.get("url", "")
        fetched, fetch_err = utility.fetcher(ctx, url, fetchdef)

        if fetch_err is not None:
            return {"ok": False, "err": fetch_err}

        if fetched is None:
            return {
                "ok": False,
                "err": ctx.make_error("direct_no_response", "response: undefined"),
            }

        if isinstance(fetched, dict):
            status = helpers.to_int(vs.getprop(fetched, "status"))
            headers = vs.getprop(fetched, "headers") or {}

            # No-body responses (204, 304) and explicit zero content-length
            # must skip JSON parsing — calling json() on an empty body raises.
            content_length = None
            if isinstance(headers, dict):
                content_length = headers.get("content-length")
            no_body = status in (204, 304) or str(content_length) == "0"

            json_data = None
            if not no_body:
                jf = vs.getprop(fetched, "json")
                if callable(jf):
                    try:
                        json_data = jf()
                    except Exception:
                        # Non-JSON body (e.g. text/plain, text/html). Surface
                        # status + headers but leave data as None.
                        json_data = None

            return {
                "ok": status >= 200 and status < 300,
                "status": status,
                "headers": headers,
                "data": json_data,
            }

        return {
            "ok": False,
            "err": ctx.make_error("direct_invalid", "invalid response type"),
        }


    @property
    def book_of_answer(self):
        """Idiomatic facade: client.book_of_answer.list() / client.book_of_answer.load({"id": ...})."""
        from entity.book_of_answer_entity import BookOfAnswerEntity
        cached = getattr(self, "_book_of_answer", None)
        if cached is None:
            cached = BookOfAnswerEntity(self, None)
            self._book_of_answer = cached
        return cached

    def BookOfAnswer(self, data=None):
        # Deprecated: use client.book_of_answer instead.
        from entity.book_of_answer_entity import BookOfAnswerEntity
        return BookOfAnswerEntity(self, data)


    @property
    def get_api_doc(self):
        """Idiomatic facade: client.get_api_doc.list() / client.get_api_doc.load({"id": ...})."""
        from entity.get_api_doc_entity import GetApiDocEntity
        cached = getattr(self, "_get_api_doc", None)
        if cached is None:
            cached = GetApiDocEntity(self, None)
            self._get_api_doc = cached
        return cached

    def GetApiDoc(self, data=None):
        # Deprecated: use client.get_api_doc instead.
        from entity.get_api_doc_entity import GetApiDocEntity
        return GetApiDocEntity(self, data)


    @property
    def market_data(self):
        """Idiomatic facade: client.market_data.list() / client.market_data.load({"id": ...})."""
        from entity.market_data_entity import MarketDataEntity
        cached = getattr(self, "_market_data", None)
        if cached is None:
            cached = MarketDataEntity(self, None)
            self._market_data = cached
        return cached

    def MarketData(self, data=None):
        # Deprecated: use client.market_data instead.
        from entity.market_data_entity import MarketDataEntity
        return MarketDataEntity(self, data)


    @property
    def poetry__oracle(self):
        """Idiomatic facade: client.poetry__oracle.list() / client.poetry__oracle.load({"id": ...})."""
        from entity.poetry__oracle_entity import PoetryOracleEntity
        cached = getattr(self, "_poetry__oracle", None)
        if cached is None:
            cached = PoetryOracleEntity(self, None)
            self._poetry__oracle = cached
        return cached

    def PoetryOracle(self, data=None):
        # Deprecated: use client.poetry__oracle instead.
        from entity.poetry__oracle_entity import PoetryOracleEntity
        return PoetryOracleEntity(self, data)


    @property
    def tool(self):
        """Idiomatic facade: client.tool.list() / client.tool.load({"id": ...})."""
        from entity.tool_entity import ToolEntity
        cached = getattr(self, "_tool", None)
        if cached is None:
            cached = ToolEntity(self, None)
            self._tool = cached
        return cached

    def Tool(self, data=None):
        # Deprecated: use client.tool instead.
        from entity.tool_entity import ToolEntity
        return ToolEntity(self, data)


    @property
    def word(self):
        """Idiomatic facade: client.word.list() / client.word.load({"id": ...})."""
        from entity.word_entity import WordEntity
        cached = getattr(self, "_word", None)
        if cached is None:
            cached = WordEntity(self, None)
            self._word = cached
        return cached

    def Word(self, data=None):
        # Deprecated: use client.word instead.
        from entity.word_entity import WordEntity
        return WordEntity(self, data)


    @property
    def words_learning(self):
        """Idiomatic facade: client.words_learning.list() / client.words_learning.load({"id": ...})."""
        from entity.words_learning_entity import WordsLearningEntity
        cached = getattr(self, "_words_learning", None)
        if cached is None:
            cached = WordsLearningEntity(self, None)
            self._words_learning = cached
        return cached

    def WordsLearning(self, data=None):
        # Deprecated: use client.words_learning instead.
        from entity.words_learning_entity import WordsLearningEntity
        return WordsLearningEntity(self, data)



    @classmethod
    def test(cls, testopts=None, sdkopts=None):
        if sdkopts is None:
            sdkopts = {}
        sdkopts = vs.clone(sdkopts)
        if not isinstance(sdkopts, dict):
            sdkopts = {}

        if testopts is None:
            testopts = {}
        testopts = vs.clone(testopts)
        if not isinstance(testopts, dict):
            testopts = {}
        testopts["active"] = True

        vs.setpath(sdkopts, "feature.test", testopts)

        sdk = cls(sdkopts)
        sdk.mode = "test"

        return sdk
