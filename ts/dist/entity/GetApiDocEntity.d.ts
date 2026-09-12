import { AnswerbookEntityBase } from '../AnswerbookEntityBase';
import type { AnswerbookSDK } from '../AnswerbookSDK';
import type { Control } from '../types';
import type { GetApiDoc, GetApiDocLoadMatch } from '../AnswerbookTypes';
declare class GetApiDocEntity extends AnswerbookEntityBase<GetApiDoc> {
    constructor(client: AnswerbookSDK, entopts: any);
    make(this: GetApiDocEntity): GetApiDocEntity;
    load(this: any, reqmatch?: GetApiDocLoadMatch, ctrl?: Control): Promise<GetApiDocEntity>;
}
export { GetApiDocEntity };
