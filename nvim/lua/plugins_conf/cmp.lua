local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()

local function is_indent()
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  if c == 0 then
    return true
  end
  local line = vim.api.nvim_get_current_line()
  if c > 0 and line:sub(c, c):match("%s") then
    return true
  end
  return false
end

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fb)
      if cmp.visible() then
        cmp.select_next_item(s)
      elseif is_indent() then
        fb()
      else
        cmp.complete()
      end
    end, {"i", "s"}),
    ["<S-Tab>"] = cmp.mapping(function(fb)
      if cmp.visible() then
        cmp.select_prev_item(s)
      else
        fb()
      end
    end, {"i", "s"}),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "treesitter" },
    { name = "buffer" },
    { name = "luasnip" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "cmdline" },
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})
