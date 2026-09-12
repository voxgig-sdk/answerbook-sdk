import { AnswerbookEntityBase } from '../AnswerbookEntityBase';
import type { AnswerbookSDK } from '../AnswerbookSDK';
import type { Control } from '../types';
import type { BookOfAnswer, BookOfAnswerLoadMatch } from '../AnswerbookTypes';
declare class BookOfAnswerEntity extends AnswerbookEntityBase<BookOfAnswer> {
    constructor(client: AnswerbookSDK, entopts: any);
    make(this: BookOfAnswerEntity): BookOfAnswerEntity;
    load(this: any, reqmatch?: BookOfAnswerLoadMatch, ctrl?: Control): Promise<BookOfAnswerEntity>;
}
export { BookOfAnswerEntity };
