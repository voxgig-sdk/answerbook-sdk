package core

type AnswerbookError struct {
	IsAnswerbookError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewAnswerbookError(code string, msg string, ctx *Context) *AnswerbookError {
	return &AnswerbookError{
		IsAnswerbookError: true,
		Sdk:              "Answerbook",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *AnswerbookError) Error() string {
	return e.Msg
}
