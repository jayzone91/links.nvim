local config = require("links.config")
local open = require("links.open")
local extendVimUiOpen = require("links.extend-vim-ui-open")

---@class SetupOptions
---@field expanders? LinkExpander[]
---@field extendVimUiOpen? boolean

---@param opts SetupOptions
local function setup(opts)
  if opts.expanders ~= nil then
    vim.list_extend(config.expanders, opts.expanders)
  end

  if opts.extendVimUiOpen ~= false then
    extendVimUiOpen()
  end

  vim.api.nvim_create_user_command("OpenLink", function()
    open()
  end, {})
end

---@param ... LinkExpander[]
local function addExpanders(...)
  vim.list_extend(config.expanders, { ... })
end

---@param ... LinkExpander[]
local function prependExpanders(...)
  vim.list_extend({ ... }, config.expanders)
end

return {
  setup = setup,
  open = open,
  addExpanders = addExpanders,
  prependExpanders = prependExpanders,
}
