
const envlocal = __dirname + '/../../../.env.local'
require('dotenv').config({ quiet: true, path: [envlocal] })

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'


import { AnswerbookSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveDelay,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


describe('BookOfAnswerEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when ANSWERBOOK_TEST_LIVE=TRUE.
  afterEach(liveDelay('ANSWERBOOK_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = AnswerbookSDK.test()
    const ent = testsdk.BookOfAnswer()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.ANSWERBOOK_TEST_LIVE
    for (const op of ['load']) {
      if (maybeSkipControl(t, 'entityOp', 'book_of_answer.' + op, live)) return
    }

    const setup = basicSetup()
    // The basic flow consumes synthetic IDs and field values from the
    // fixture (entity TestData.json). Those don't exist on the live API.
    // Skip live runs unless the user provided a real ENTID env override.
    if (setup.syntheticOnly) {
      t.skip('live entity test uses synthetic IDs from fixture — set ANSWERBOOK_TEST_BOOK_OF_ANSWER_ENTID JSON to run live')
      return
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let book_of_answer_ref01_data = Object.values(setup.data.existing.book_of_answer)[0] as any

    // LOAD
    const book_of_answer_ref01_ent = client.BookOfAnswer()
    const book_of_answer_ref01_match_dt0: any = {}
    book_of_answer_ref01_match_dt0.id = book_of_answer_ref01_data.id
    const book_of_answer_ref01_data_dt0 = await book_of_answer_ref01_ent.load(book_of_answer_ref01_match_dt0)
    assert(book_of_answer_ref01_data_dt0.id === book_of_answer_ref01_data.id)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/book_of_answer/BookOfAnswerTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = AnswerbookSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['book_of_answer01','book_of_answer02','book_of_answer03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  // Detect whether the user provided a real ENTID JSON via env var. The
  // basic flow consumes synthetic IDs from the fixture file; without an
  // override those synthetic IDs reach the live API and 4xx. Surface this
  // to the test so it can skip rather than fail.
  const idmapEnvVal = process.env['ANSWERBOOK_TEST_BOOK_OF_ANSWER_ENTID']
  const idmapOverridden = null != idmapEnvVal && idmapEnvVal.trim().startsWith('{')

  const env = envOverride({
    'ANSWERBOOK_TEST_BOOK_OF_ANSWER_ENTID': idmap,
    'ANSWERBOOK_TEST_LIVE': 'FALSE',
    'ANSWERBOOK_TEST_EXPLAIN': 'FALSE',
    'ANSWERBOOK_APIKEY': 'NONE',
  })

  idmap = env['ANSWERBOOK_TEST_BOOK_OF_ANSWER_ENTID']

  const live = 'TRUE' === env.ANSWERBOOK_TEST_LIVE

  if (live) {
    client = new AnswerbookSDK(merge([
      {
        apikey: env.ANSWERBOOK_APIKEY,
      },
      extra
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.ANSWERBOOK_TEST_EXPLAIN,
    live,
    syntheticOnly: live && !idmapOverridden,
    now: Date.now(),
  }

  return setup
}
  
