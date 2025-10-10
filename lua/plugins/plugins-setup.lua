-- 自动安装packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- 保存此文件自动更新安装软件
-- 注意PackerCompile改成了PackerSync
-- plugins.lua改成了plugins-setup.lua，适应本地文件名字
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use {
    'wbthomason/packer.nvim',
    commit = "ea0cc3c59f67c440c5ff0bbe4fb9420f4350b9a3"
  }
  use { 
    "catppuccin/nvim", 
    as = "catppuccin",
    commit = "af58927c55c9f3272c940ff02b3cee94a1249f26"    
  }
  use {
    'nvim-lualine/lualine.nvim',  -- 状态栏
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },  -- 状态栏图标
    commit = "b8c23159c0161f4b89196f74ee3a6d02cdc3a955"
  }
  use {
    'nvim-tree/nvim-tree.lua',
    commit = "e397756d2a79d74314ea4cd3efc41300e91c0ff0"   
  }
  use {
    "ojroques/nvim-osc52",
    commit = "04cfaba1865ae5c53b6f887c3ca7304973824fb2"
  }
  use {
    "christoomey/vim-tmux-navigator", -- 用ctl-hjkl来定位窗口
    commit = "c45243dc1f32ac6bcf6068e5300f3b2b237e576a"
  }
  use {
    "nvim-treesitter/nvim-treesitter", -- 语法高亮
    commit = "42fc28ba918343ebfd5565147a42a26580579482"
  }
  use {
    "p00f/nvim-ts-rainbow", -- 配合treesitter，不同括号颜色区分
    commit = "ef95c15a935f97c65a80e48e12fe72d49aacf9b9"
  }
  use {
    "williamboman/mason.nvim",
    commit = "fc98833b6da5de5a9c5b1446ac541577059555be"
  }
  use {
    "williamboman/mason-lspconfig.nvim",  -- 这个相当于mason.nvim和lspconfig的桥梁
    commit = "1a31f824b9cd5bc6f342fc29e9a53b60d74af245"
  }
  use {
    "neovim/nvim-lspconfig",
    commit = "cc2f5f2fa28d240574808e78847978ed6ef20d2a"
  }
  use {
    "hrsh7th/nvim-cmp",
    commit = "b5311ab3ed9c846b585c0c15b7559be131ec4be9"
  }
  use {
    "hrsh7th/cmp-nvim-lsp",
    commit = "bd5a7d6db125d4654b50eeae9f5217f24bb22fd3"
  }
  use {
    "L3MON4D3/LuaSnip", -- snippets引擎，不装这个自动补全会出问题
    commit = "73813308abc2eaeff2bc0d3f2f79270c491be9d7"
  }
  use {
    "saadparwaiz1/cmp_luasnip",
    commit = "98d9cb5c2c38532bd9bdb481067b20fea8f32e90"
  }
  use {
    "rafamadriz/friendly-snippets",
    commit = "572f5660cf05f8cd8834e096d7b4c921ba18e175"
  }
  use {
    "hrsh7th/cmp-path", -- 文件路径
    commit = "c642487086dbd9a93160e1679a1327be111cbc25"
  }
  use {
    "numToStr/Comment.nvim", -- gcc和gc注释
    commit = "e30b7f2008e52442154b66f7c519bfd2f1e32acb"
  }
  use {
    "windwp/nvim-autopairs", -- 自动补全括号
    commit = "23320e75953ac82e559c610bec5a90d9c6dfa743"
  }
  use {
    "akinsho/bufferline.nvim", -- buffer分割线
    commit = "655133c3b4c3e5e05ec549b9f8cc2894ac6f51b3"
  }
  use {
    "github/copilot.vim",
    commit = "da369d90cfd6c396b1d0ec259836a1c7222fb2ea"
  }
  use {
    "lewis6991/gitsigns.nvim", -- 左则git提示
    commit = "1ee5c1fd068c81f9dd06483e639c2aa4587dc197"
  }
  use {
    "akinsho/toggleterm.nvim", 
    tag = "*",
    commit = "50ea089fc548917cc3cc16b46a8211833b9e3c7c"
  }
  use {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.1',  -- 文件检索
    commit = "c1a2af0af69e80e14e6b226d3957a064cd080805",
    requires = { {'nvim-lua/plenary.nvim', commit = "b9fd5226c2f76c951fc8ed5923d85e4de065e509"} }
  }
  use {
    "lervag/vimtex",
    commit = "5c457a8a4dd57ca942260ff843a5482b064d9d9b"
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
