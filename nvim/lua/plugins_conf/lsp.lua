local mode = require("consts").modes

require("mason").setup()
local masonlsp =  require("mason-lspconfig")
local lspconfig = require("lspconfig")

masonlsp.setup()

masonlsp.setup_handlers({
  function (server_name)
    lspconfig[server_name].setup({})
  end,
})

-- lsp_signature UI tweaks
require("lsp_signature").setup({
  bind = true,
  handler_opts = {
    border = "rounded",
  },
})

-- LSP hover window UI tweaks
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "single"
  }
)

-- LSP diagnostics
vim.diagnostic.config {
    float = { border = "single" },
    underline = true,
    virtual_text = false,
    virtual_lines = false
}

-- Key bindings to be set after LSP attaches to buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.api.nvim_buf_set_option(ev.buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
    vim.api.nvim_buf_set_option(ev.buf, "formatexpr", "v:lua.vim.lsp.formatexpr()")

    local opts = { buffer = ev.buf }
    vim.keymap.set(mode.normal, "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set(mode.normal, "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set(mode.normal, "K", vim.lsp.buf.hover, opts)
    vim.keymap.set(mode.normal, "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set(mode.normal, "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set(mode.normal, "]d", vim.diagnostic.goto_next, opts)
  end,
})
