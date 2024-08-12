local api = require("nvim-tree.api")
local Mode = require("consts").modes

local function on_attach(bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }

  vim.keymap.set(Mode.normal, "<C-v>", api.node.open.vertical, opts)
  vim.keymap.set(Mode.normal, "<C-x>", api.node.open.horizontal, opts)
  vim.keymap.set(Mode.normal, "r", api.tree.reload, opts)
  vim.keymap.set(Mode.normal, "a", api.fs.create, opts)
  vim.keymap.set(Mode.normal, "d", api.fs.remove, opts)
  vim.keymap.set(Mode.normal, "m", api.fs.rename_sub, opts)
  vim.keymap.set(Mode.normal, "y", api.fs.copy.relative_path, opts)
  vim.keymap.set(Mode.normal, "Y", api.fs.copy.absolute_path, opts)
  vim.keymap.set(Mode.normal, "C", api.tree.collapse_all, opts)
  vim.keymap.set(Mode.normal, "K", api.node.show_info_popup, opts)
  vim.keymap.set(Mode.normal, "o", api.node.open.edit, opts)
end

require("nvim-tree").setup({
  auto_reload_on_write = true,
  hijack_cursor = true,
  update_focused_file = {
    enable = true
  },
  sort_by = "name",
  filters = {
    custom = {
      ".git"
    }
  },
  renderer = {
    highlight_opened_files = "name",
  },
  on_attach = on_attach,
  view = {
    side = "left",
    adaptive_size = false,
    centralize_selection = true,
    width = 30,
  },
})

vim.keymap.set(Mode.normal, "<leader>e", ":NvimTreeToggle<CR>", { noremap = true })
