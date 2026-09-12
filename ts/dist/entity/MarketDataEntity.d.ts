import { AnswerbookEntityBase } from '../AnswerbookEntityBase';
import type { AnswerbookSDK } from '../AnswerbookSDK';
import type { Control } from '../types';
import type { MarketData, MarketDataLoadMatch } from '../AnswerbookTypes';
declare class MarketDataEntity extends AnswerbookEntityBase<MarketData> {
    constructor(client: AnswerbookSDK, entopts: any);
    make(this: MarketDataEntity): MarketDataEntity;
    load(this: any, reqmatch?: MarketDataLoadMatch, ctrl?: Control): Promise<MarketDataEntity>;
}
export { MarketDataEntity };
