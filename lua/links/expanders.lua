local function regex(pattern, replacement)
  return function(link)
    return vim.fn.substitute(link, pattern, replacement, "")
  end
end

local github_regex = vim.regex("\\v^[a-zA-Z0-9_-]+/[.a-zA-Z0-9_-]+$")

local function github(link)
  if github_regex:match_str(link) then
    return "https://github.com/" .. link
  end
end

local function homedir()
  return function(link)
    if vim.startswith(link, "~") then
      return "file://" .. os.getenv("HOME") .. link:sub(2)
    end
  end
end

return {
  regex = regex,
  github = github,
  homedir = homedir,
}
