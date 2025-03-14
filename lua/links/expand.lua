local config = require("links.config")
local helpers = require("links.helpers")

local function expand(link)
  for _, expander in ipairs(config.expanders) do
    local expanded_link = expander(link)
    if expanded_link ~= nil then
      link = expanded_link
    end
  end
  if not helpers.isHttpOrFileLink(link) then
    local path_to_file = helpers.findAbsPath(link)
    if path_to_file ~= nil then
      return path_to_file
    end
  end
  return link
end

return expand
