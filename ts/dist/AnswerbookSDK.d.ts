import { BookOfAnswerEntity } from './entity/BookOfAnswerEntity';
import { GetApiDocEntity } from './entity/GetApiDocEntity';
import { MarketDataEntity } from './entity/MarketDataEntity';
import { PoetryOracleEntity } from './entity/PoetryOracleEntity';
import { ToolEntity } from './entity/ToolEntity';
import { WordEntity } from './entity/WordEntity';
import { WordsLearningEntity } from './entity/WordsLearningEntity';
export type * from './AnswerbookTypes';
import { inspect } from 'node:util';
import type { Context, Feature } from './types';
import { config } from './Config';
import { AnswerbookEntityBase } from './AnswerbookEntityBase';
import { Utility } from './utility/Utility';
import { BaseFeature } from './feature/base/BaseFeature';
declare const stdutil: Utility;
declare class AnswerbookSDK {
    _mode: string;
    _options: any;
    _utility: Utility;
    _features: Feature[];
    _rootctx: Context;
    constructor(options?: any);
    options(): any;
    utility(): any;
    prepare(fetchargs?: any): Promise<any>;
    direct(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    _rawRequest(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    graphql(query: string, variables?: any, ctrl?: any): Promise<any>;
    BookOfAnswer(entopts?: Record<string, any>): BookOfAnswerEntity;
    GetApiDoc(entopts?: Record<string, any>): GetApiDocEntity;
    MarketData(entopts?: Record<string, any>): MarketDataEntity;
    PoetryOracle(entopts?: Record<string, any>): PoetryOracleEntity;
    Tool(entopts?: Record<string, any>): ToolEntity;
    Word(entopts?: Record<string, any>): WordEntity;
    WordsLearning(entopts?: Record<string, any>): WordsLearningEntity;
    static test(testoptsarg?: any, sdkoptsarg?: any): AnswerbookSDK;
    tester(testopts?: any, sdkopts?: any): AnswerbookSDK;
    toJSON(): {
        name: string;
    };
    toString(): string;
    [inspect.custom](): string;
}
declare const SDK: typeof AnswerbookSDK;
export { stdutil, config, BaseFeature, AnswerbookEntityBase, AnswerbookSDK, SDK, };
