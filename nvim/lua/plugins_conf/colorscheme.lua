require('material').setup {
  plugins = {
    "nvim-cmp",
    "telescope",
    "gitsigns",
    "nvim-tree",
    "nvim-web-devicons",
  },
  disable = {
    background = true,
  },
  lualine_style = "stealth",
}

require('lualine').setup {
  options = {
    theme = 'auto'
  }
}

vim.cmd[[colorscheme material]]
vim.g.material_style = "lighter"
