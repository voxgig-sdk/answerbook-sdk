import { AnswerbookEntityBase } from '../AnswerbookEntityBase';
import type { AnswerbookSDK } from '../AnswerbookSDK';
import type { Control } from '../types';
import type { Word, WordLoadMatch } from '../AnswerbookTypes';
declare class WordEntity extends AnswerbookEntityBase<Word> {
    constructor(client: AnswerbookSDK, entopts: any);
    make(this: WordEntity): WordEntity;
    load(this: any, reqmatch?: WordLoadMatch, ctrl?: Control): Promise<WordEntity>;
}
export { WordEntity };
