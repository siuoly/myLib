## Add new cmp source on LazyVim

```lua
{
  "hrsh7th/nvim-cmp",
  optional = true,
  dependencies = { "hrsh7th/cmp-emoji"},
  opts = function(_, opts)
    opts.sources = opts.sources or {}
    table.insert(opts.sources, { name = "emoji" })
  end,
}
```
note that emoji start with ":",  e.g. :x:, :smile:, 
all emoji in [file](/home/siuoly/.local/share/nvim/lazy/cmp-emoji/lua/cmp_emoji/items.lua)
or in [github](https://github.com/hrsh7th/cmp-emoji/blob/main/lua/cmp_emoji/items.lua)
