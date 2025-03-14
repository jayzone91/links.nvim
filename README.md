# links.nvim

Neovim plugin to open links in your default browser (or copy to clipboard when in an SSH session).

## Installation
Using [Lazy](https://github.com/folke/lazy.nvim):

```lua
{
    "jayzone91/links.nvim",
    cmd = {"OpenLink"},
    opts = function()
        -- Default Config
        local expanders = require("links.expanders")
        return {
            expanders = {
                -- expands "{user}/{repo}" to the github repo URL
                expanders.github,
            }
        }
    end,
    config = function(_, opts)
        require("links").setup(opts)
    end,
    keys = {
        {
            "gx",
            ":OpenLink<CR>",
            desc = "Open Link under the Cursor"
        }
    }
}
```
