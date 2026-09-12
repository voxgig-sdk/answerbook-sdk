import { AnswerbookEntityBase } from '../AnswerbookEntityBase';
import type { AnswerbookSDK } from '../AnswerbookSDK';
import type { Control } from '../types';
import type { Tool, ToolLoadMatch } from '../AnswerbookTypes';
declare class ToolEntity extends AnswerbookEntityBase<Tool> {
    constructor(client: AnswerbookSDK, entopts: any);
    make(this: ToolEntity): ToolEntity;
    load(this: any, reqmatch?: ToolLoadMatch, ctrl?: Control): Promise<ToolEntity>;
}
export { ToolEntity };
