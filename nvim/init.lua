require('packer-plugins')
require('plugins-setup')

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
map("n", "<leader>n", ":BufferNext<CR>")
map("n", "<leader>N", ":BufferPrevious<CR>")
map("n", "<leader>q", ":BufferClose<CR>")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.cmd [[ setlocal sw=4 ts=4 sts=4 ]]
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "javascript",
  callback = function()
    vim.cmd [[ setlocal sw=2 ts=2 sts=2 ]]
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "typescriptreact",
  callback = function()
    vim.cmd [[ setlocal sw=2 ts=2 sts=2 ]]
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "typescript",
  callback = function()
    vim.cmd [[ setlocal sw=2 ts=2 sts=2 ]]
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "svelte",
  callback = function()
    vim.cmd [[ setlocal sw=2 ts=2 sts=2 ]]
  end
})
