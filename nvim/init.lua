vim.g.mapleader = " "
vim.opt.nu = true
vim.opt.bg = "light"

require('packer-plugins')

require('nvim-treesitter.configs').setup({
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}) 

require('nvim-tree').setup()

require('telescope').setup({
  defaults = {
    mappings = {
      n = { ["q"] = require('telescope.actions').close },
    },
  }
})

require("nvim-lsp-installer").setup({
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

require('lualine').setup()

vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
vim.cmd[[colorscheme catppuccin]]

vim.g.diagnostics_enabled = true

-- Map custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Pane navigation
map("n", "<C-h>", "<C-w><C-h>")
map("n", "<C-j>", "<C-w><C-j>")
map("n", "<C-k>", "<C-w><C-k>")
map("n", "<C-l>", "<C-w><C-l>")

-- Copy/Paste
map("v", "<leader>c", '"*yy<CR>')
map("v", "<leader>v", '"+p<CR>')
map("n", "<leader>v", '"+p<CR>')

-- Plugins bindings
map("n", "<leader>p", ":Telescope find_files hidden=true<CR>")
map("n", "<leader>f", ":Telescope live_grep<CR>")
map("n", "<leader>s", ":Telescope grep_string<CR>")
map("n", "<leader>b", ":Telescope buffers<CR>")
map("n", "<leader>h", ":Telescope help_tags<CR>")
map("n", "<leader>e", ":NvimTreeToggle <CR>")
