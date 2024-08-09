-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Plugins
local function get_setup(conf_name)
  return function(_plugin, _opts)
    local mod = string.format("plugins_conf.%s", conf_name)
    require(mod)
  end
end

local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    build = "TSUpdate",
    config = get_setup("treesitter"),
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", build = ":MasonUpdate" },
      { "williamboman/mason-lspconfig.nvim" },
      { "ray-x/lsp_signature.nvim" },
    },
    config = get_setup("lsp"),
  },
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      "romgrk/barbar.nvim",
    },
    config = get_setup("nvim_tree"),
  },
  {
    "https://github.com/lewis6991/gitsigns.nvim",
    config = get_setup("gitsigns"),
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
	build = "make",
      },
    },
    config = get_setup("telescope"),
  },
  {
    "folke/tokyonight.nvim",
    dependencies = {
      "nvim-lualine/lualine.nvim",
    },
    config = get_setup("colorscheme"),
  },
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    config = get_setup("barbar"),
  },
  {
    "akinsho/toggleterm.nvim",
    config = get_setup("toggleterm"),
  },
}

local opts = {}
require("lazy").setup(plugins, opts)
