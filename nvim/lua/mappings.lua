local mode = require("consts").modes

vim.g.mapleader = " "

-- Pane navigation
vim.keymap.set(mode.normal, "<C-j>", "<C-w><C-j>", { noremap = true })
vim.keymap.set(mode.normal, "<C-k>", "<C-w><C-k>", { noremap = true })
vim.keymap.set(mode.normal, "<C-l>", "<C-w><C-l>", { noremap = true })
vim.keymap.set(mode.normal, "<C-h>", "<C-w><C-h>", { noremap = true })

-- copy/paste
vim.keymap.set(mode.visual_select, '<leader>c', '"+yy<CR>', { noremap = true })
vim.keymap.set(mode.visual_select, '<leader>v', '"+p<CR>', { noremap = true })
vim.keymap.set(mode.normal, '<leader>v', '"+p<CR>', { noremap = true })

-- Terminal buffer-scoped maps
function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, mode.terminal, "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, mode.terminal, "<C-j>", [[<C-\><C-n><C-w>j]], opts)
  vim.api.nvim_buf_set_keymap(0, mode.terminal, "<C-k>", [[<C-\><C-n><C-w>k]], opts)
  vim.api.nvim_buf_set_keymap(0, mode.terminal, "<C-l>", [[<C-\><C-n><C-w>l]], opts)
  vim.api.nvim_buf_set_keymap(0, mode.terminal, "<C-h>", [[<C-\><C-n><C-w>h]], opts)
  vim.api.nvim_buf_set_keymap(0, mode.normal, "<C-c>", [[i]], opts)
  vim.api.nvim_buf_set_keymap(0, mode.normal, "q", [[i]], opts)
  vim.api.nvim_buf_set_keymap(0, mode.normal, "p", [[pi]], opts)
end

vim.cmd [[ autocmd TermOpen term://* lua set_terminal_keymaps() ]]

vim.g.copilot_no_tab_map = true

vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      silent = true,
      script = true
    })
  end
})
