vim.g.mapleader = " "
vim.opt.nu = true
vim.o.signcolumn = "yes:1"

require('packer-plugins')

require('nvim-treesitter.configs').setup({
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}) 

local nvim_tree_events = require("nvim-tree.events")
local bufferline_state = require("bufferline.state")

require('nvim-tree').setup({
  auto_reload_on_write = true,
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
  view = {
    side = "left",
    adaptive_size = true,
    centralize_selection = true,
    width = 30,
    mappings = {
      custom_only = false,
      list = {
        { key = "<C-v>",   action = "vsplit" },
        { key = "<C-x>",   action = "split" },
        { key = "r",       action = "refresh" },
        { key = "a",       action = "create" },
        { key = "d",       action = "remove" },
        { key = "m",       action = "rename" },
        { key = "y",       action = "copy_name" },
        { key = "Y",       action = "copy_path" },
        { key = "gy",      action = "copy_absolute_path" },
        { key = "q",       action = "close" },
        { key = "W",       action = "collapse_all" },
        { key = "S",       action = "search_node" },
        { key = "<C-k>",   action = "toggle_file_info" },
        { key = ">",       action = "more_wide", action_cb = inc_width },
        { key = "<",       action = "less_wide", action_cb = dec_width },
      },
    },
  }
})

nvim_tree_events.on_tree_resize(function (new_size)
  bufferline_state.set_offset(new_size, "File Tree")
end)

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

require('gitsigns').setup({
   current_line_blame = true,
})

require('bufferline').setup({
  -- Enable/disable animations
  animation = true,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = true,

  -- Enable/disable close button
  closable = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  exclude_ft = {},
  exclude_name = {},

  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = true,

  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = false,

  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,
  insert_at_start = false,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = nil,
})

local Direction = {
  horizontal = "horizontal",
  vertical = "vertical",
  tab = "tab",
  float = "float"
}

require("toggleterm").setup({
  open_mapping = [[<c-\>]],
  direction = Direction.float,
  hide_numbers = true,
  shade_terminals = true,
  shading_factor = 3,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'curved',
    width = function()
      math.floor(vim.api.nvim_win_get_width(0) * 0.8)
    end,
    height = function()
      math.floor(vim.api.nvim_win_get_height(0) * 0.8)
    end,
    winblend = 3,
  }
})

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
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
map("n", "<leader>n", ":BufferNext<CR>")
map("n", "<leader>N", ":BufferPrevious<CR>")
map("n", "<leader>q", ":BufferClose<CR>")

vim.api.nvim_create_autocmd("FileType", {
   pattern = "javascript",
   callback = function()
	vim.cmd [[ setlocal sw=2 ts=2 sts=2 ]]
   end
})
