// Answerbook Ts SDK

import { BookOfAnswerEntity } from './entity/BookOfAnswerEntity'
import { GetApiDocEntity } from './entity/GetApiDocEntity'
import { MarketDataEntity } from './entity/MarketDataEntity'
import { PoetryOracleEntity } from './entity/PoetryOracleEntity'
import { ToolEntity } from './entity/ToolEntity'
import { WordEntity } from './entity/WordEntity'
import { WordsLearningEntity } from './entity/WordsLearningEntity'

export type * from './AnswerbookTypes'


import { inspect } from 'node:util'

import type { Context, Feature } from './types'

import { config } from './Config'
import { AnswerbookEntityBase } from './AnswerbookEntityBase'
import { Utility } from './utility/Utility'


import { BaseFeature } from './feature/base/BaseFeature'


const stdutil = new Utility()


class AnswerbookSDK {
  _mode: string = 'live'
  _options: any
  _utility = new Utility()
  _features: Feature[]
  _rootctx: Context

  constructor(options?: any) {

    this._rootctx = this._utility.makeContext({
      client: this,
      utility: this._utility,
      config,
      options,
      shared: new WeakMap()
    })

    this._options = this._utility.makeOptions(this._rootctx)

    const struct = this._utility.struct
    const getpath = struct.getpath
    const items = struct.items

    if (true === getpath(this._options.feature, 'test.active')) {
      this._mode = 'test'
    }

    this._rootctx.options = this._options

    this._features = []

    const featureAdd = this._utility.featureAdd
    const featureInit = this._utility.featureInit

    items(this._options.feature, (fitem: [string, any]) => {
      const fname = fitem[0]
      const fopts = fitem[1]
      if (fopts.active) {
        featureAdd(this._rootctx, this._rootctx.config.makeFeature(fname))
      }
    })

    if (null != this._options.extend) {
      for (let f of this._options.extend) {
        featureAdd(this._rootctx, f)
      }
    }

    for (let f of this._features) {
      featureInit(this._rootctx, f)
    }

    const featureHook = this._utility.featureHook
    featureHook(this._rootctx, 'PostConstruct')
  }


  options() {
    return this._utility.struct.clone(this._options)
  }


  utility() {
    return this._utility.struct.clone(this._utility)
  }


  async prepare(fetchargs?: any) {
    const utility = this._utility
    const struct = utility.struct
    const clone = struct.clone

    const {
      makeContext,
      makeFetchDef,
      prepareHeaders,
      prepareAuth,
    } = utility

    fetchargs = fetchargs || {}

    let ctx: Context = makeContext({
      opname: 'prepare',
      ctrl: fetchargs.ctrl || {},
    }, this._rootctx)

    const options = this._options

    // Build spec directly from SDK options + user-provided fetch args.
    const spec: any = {
      base: options.base,
      prefix: options.prefix,
      suffix: options.suffix,
      path: fetchargs.path || '',
      method: fetchargs.method || 'GET',
      params: fetchargs.params || {},
      query: fetchargs.query || {},
      headers: prepareHeaders(ctx),
      body: fetchargs.body,
      step: 'start',
    }

    ctx.spec = spec

    // Merge user-provided headers over SDK defaults.
    if (fetchargs.headers) {
      const uheaders = fetchargs.headers
      for (let key in uheaders) {
        spec.headers[key] = uheaders[key]
      }
    }

    // Apply SDK auth (apikey, auth prefix, etc.)
    const authResult = prepareAuth(ctx)
    if (authResult instanceof Error) {
      return authResult
    }

    return makeFetchDef(ctx)
  }


  async direct(fetchargs?: any) {
    const utility = this._utility
    const fetcher = utility.fetcher
    const makeContext = utility.makeContext

    const fetchdef = await this.prepare(fetchargs)
    if (fetchdef instanceof Error) {
      return fetchdef
    }

    let ctx: Context = makeContext({
      opname: 'direct',
      ctrl: (fetchargs || {}).ctrl || {},
    }, this._rootctx)

    try {
      const fetched = await fetcher(ctx, fetchdef.url, fetchdef)

      if (null == fetched) {
        return { ok: false, err: ctx.error('direct_no_response', 'response: undefined') }
      }
      else if (fetched instanceof Error) {
        return { ok: false, err: fetched }
      }

      const status = fetched.status

      // No body responses (204 No Content, 304 Not Modified) and explicit
      // zero content-length must skip JSON parsing — fetched.json() would
      // throw `Unexpected end of JSON input` on an empty body.
      const headers = fetched.headers
      const contentLength = headers && 'function' === typeof headers.get
        ? headers.get('content-length')
        : (headers || {})['content-length']
      const noBody = 204 === status || 304 === status || '0' === String(contentLength)

      let json: any = undefined
      if (!noBody) {
        try {
          json = 'function' === typeof fetched.json ? await fetched.json() : fetched.json
        }
        catch (parseErr) {
          // Body wasn't valid JSON — surface the raw response rather than
          // throwing. data stays undefined; callers can inspect status/headers.
          json = undefined
        }
      }

      return {
        ok: status >= 200 && status < 300,
        status,
        headers: fetched.headers,
        data: json,
      }
    }
    catch (err: any) {
      return { ok: false, err }
    }
  }



  _book_of_answer?: BookOfAnswerEntity

  // Idiomatic facade: `client.book_of_answer.list()` / `client.book_of_answer.load({ id })`.
  get book_of_answer(): BookOfAnswerEntity {
    return (this._book_of_answer ??= new BookOfAnswerEntity(this, undefined))
  }

  /** @deprecated Use `client.book_of_answer` instead. */
  BookOfAnswer(data?: any) {
    const self = this
    return new BookOfAnswerEntity(self,data)
  }


  _get_api_doc?: GetApiDocEntity

  // Idiomatic facade: `client.get_api_doc.list()` / `client.get_api_doc.load({ id })`.
  get get_api_doc(): GetApiDocEntity {
    return (this._get_api_doc ??= new GetApiDocEntity(this, undefined))
  }

  /** @deprecated Use `client.get_api_doc` instead. */
  GetApiDoc(data?: any) {
    const self = this
    return new GetApiDocEntity(self,data)
  }


  _market_data?: MarketDataEntity

  // Idiomatic facade: `client.market_data.list()` / `client.market_data.load({ id })`.
  get market_data(): MarketDataEntity {
    return (this._market_data ??= new MarketDataEntity(this, undefined))
  }

  /** @deprecated Use `client.market_data` instead. */
  MarketData(data?: any) {
    const self = this
    return new MarketDataEntity(self,data)
  }


  _poetry__oracle?: PoetryOracleEntity

  // Idiomatic facade: `client.poetry__oracle.list()` / `client.poetry__oracle.load({ id })`.
  get poetry__oracle(): PoetryOracleEntity {
    return (this._poetry__oracle ??= new PoetryOracleEntity(this, undefined))
  }

  /** @deprecated Use `client.poetry__oracle` instead. */
  PoetryOracle(data?: any) {
    const self = this
    return new PoetryOracleEntity(self,data)
  }


  _tool?: ToolEntity

  // Idiomatic facade: `client.tool.list()` / `client.tool.load({ id })`.
  get tool(): ToolEntity {
    return (this._tool ??= new ToolEntity(this, undefined))
  }

  /** @deprecated Use `client.tool` instead. */
  Tool(data?: any) {
    const self = this
    return new ToolEntity(self,data)
  }


  _word?: WordEntity

  // Idiomatic facade: `client.word.list()` / `client.word.load({ id })`.
  get word(): WordEntity {
    return (this._word ??= new WordEntity(this, undefined))
  }

  /** @deprecated Use `client.word` instead. */
  Word(data?: any) {
    const self = this
    return new WordEntity(self,data)
  }


  _words_learning?: WordsLearningEntity

  // Idiomatic facade: `client.words_learning.list()` / `client.words_learning.load({ id })`.
  get words_learning(): WordsLearningEntity {
    return (this._words_learning ??= new WordsLearningEntity(this, undefined))
  }

  /** @deprecated Use `client.words_learning` instead. */
  WordsLearning(data?: any) {
    const self = this
    return new WordsLearningEntity(self,data)
  }




  static test(testoptsarg?: any, sdkoptsarg?: any) {
    const struct = stdutil.struct
    const setpath = struct.setpath
    const getdef = struct.getdef
    const clone = struct.clone
    const setprop = struct.setprop

    const sdkopts = getdef(clone(sdkoptsarg), {})
    const testopts = getdef(clone(testoptsarg), {})
    setprop(testopts, 'active', true)
    setpath(sdkopts, 'feature.test', testopts)

    const testsdk = new AnswerbookSDK(sdkopts)
    testsdk._mode = 'test'

    return testsdk
  }


  tester(testopts?: any, sdkopts?: any) {
    return AnswerbookSDK.test(testopts, sdkopts)
  }


  toJSON() {
    return { name: 'Answerbook' }
  }

  toString() {
    return 'Answerbook ' + this._utility.struct.jsonify(this.toJSON())
  }

  [inspect.custom]() {
    return this.toString()
  }

}




const SDK = AnswerbookSDK


export {
  stdutil,

  BaseFeature,
  AnswerbookEntityBase,

  AnswerbookSDK,
  SDK,
}


