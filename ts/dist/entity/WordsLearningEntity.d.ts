import { AnswerbookEntityBase } from '../AnswerbookEntityBase';
import type { AnswerbookSDK } from '../AnswerbookSDK';
import type { Control } from '../types';
import type { WordsLearning, WordsLearningListMatch } from '../AnswerbookTypes';
declare class WordsLearningEntity extends AnswerbookEntityBase<WordsLearning> {
    constructor(client: AnswerbookSDK, entopts: any);
    make(this: WordsLearningEntity): WordsLearningEntity;
    list(this: any, reqmatch?: WordsLearningListMatch, ctrl?: Control): Promise<WordsLearningEntity[]>;
}
export { WordsLearningEntity };
