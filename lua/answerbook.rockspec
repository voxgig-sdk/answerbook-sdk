package = "voxgig-sdk-answerbook"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/answerbook-sdk.git"
}
description = {
  summary = "Answerbook SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["answerbook_sdk"] = "answerbook_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
