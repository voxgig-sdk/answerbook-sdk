import { Context } from './Context';
declare class AnswerbookError extends Error {
    isAnswerbookError: boolean;
    sdk: string;
    code: string;
    ctx: Context;
    status: number;
    get notFound(): boolean;
    constructor(code: string, msg: string, ctx: Context);
}
export { AnswerbookError };
