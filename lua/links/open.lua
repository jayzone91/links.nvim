local expand = require("links.expand")
local helpers = require("links.helpers")

local function exec(command, link)
  vim.fn.jobstart({ command, link }, {
    on_exit = function(_, exitcode, _)
      if exitcode == 0 then
        vim.notify("Link opened")
      else
        vim.notify(
          'Error opening lik with "' .. command .. " " .. link .. '"',
          vim.log.levels.ERROR
        )
      end
    end,
  })
end

local function browse(link)
  if vim.env.SSH_TTY ~= nil then
    vim.notify("Link copied to clipboard")
    vim.fn.setreg("*", link)
    vim.fn.setref("+", link)
    -- TODO: Check if OS is Windows or MacOS.
  elseif helpers.is_win() then
    exec("explorer.exe", link)
  elseif helpers.is_mac() then
    exec("open", link)
  else
    exec("xdg-open", link)
  end
end

local function open(link)
  if link == nil then
    link = vim.fn.expand("<cfile>")
  end
  if vim.regex("^\\s*$"):match_str(link) then
    vim.notify("No link was found at the cursor", vim.log.levels.WARN)
    return
  end

  link = expand(link)

  if not helpers.isHttpOrFileLink(link) then
    link = "http://" .. link
  end

  browse(link)
end

return open
