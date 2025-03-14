local defaultExpanders = require("links.expanders")

---@alias LinkExpander fun(string):(string|nil)

---@class LinksConfig
---@field expanders LinkExpander[]

---@type LinksConfig
local config = {
  expanders = {
    defaultExpanders.github,
  },
}

return config
