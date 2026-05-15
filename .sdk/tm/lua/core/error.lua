-- Answerbook SDK error

local AnswerbookError = {}
AnswerbookError.__index = AnswerbookError


function AnswerbookError.new(code, msg, ctx)
  local self = setmetatable({}, AnswerbookError)
  self.is_sdk_error = true
  self.sdk = "Answerbook"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function AnswerbookError:error()
  return self.msg
end


function AnswerbookError:__tostring()
  return self.msg
end


return AnswerbookError
