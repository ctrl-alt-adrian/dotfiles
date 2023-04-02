-- [[ Setting options ]] 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- [[ Plugins object ]] 
local plugins = {
	-- Theme
	'navarasu/onedark.nvim',

	-- Quality of Life
	'numToStr/Comment.nvim',
	'tpope/vim-sleuth',
	{
	  'nvim-treesitter/nvim-treesitter', 
	  version = false,
	  build = ':TSUpdate',
	  dependencies = { 'nvim-treesitter/playground' }

	},
	'mbbill/undotree',
	-- we in here theprimeagen!!
	'theprimeagen/harpoon',

	-- Git related plugins
	'tpope/vim-fugitive',
	'lewis6991/gitsigns.nvim',

	-- fuzzy finder
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                              , branch = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	-- LSP
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
			'williamboman/mason.nvim',
			build = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
		}
	},
}
require("lazy").setup(plugins, opts)
