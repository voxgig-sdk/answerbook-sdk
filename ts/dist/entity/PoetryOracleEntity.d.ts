import { AnswerbookEntityBase } from '../AnswerbookEntityBase';
import type { AnswerbookSDK } from '../AnswerbookSDK';
import type { Control } from '../types';
import type { PoetryOracle, PoetryOracleLoadMatch } from '../AnswerbookTypes';
declare class PoetryOracleEntity extends AnswerbookEntityBase<PoetryOracle> {
    constructor(client: AnswerbookSDK, entopts: any);
    make(this: PoetryOracleEntity): PoetryOracleEntity;
    load(this: any, reqmatch?: PoetryOracleLoadMatch, ctrl?: Control): Promise<PoetryOracleEntity>;
}
export { PoetryOracleEntity };
