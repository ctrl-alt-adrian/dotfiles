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
	'Mofiqul/vscode.nvim',
	'nyoom-engineering/oxocarbon.nvim',

	-- Quality of Life
	'github/copilot.vim', -- copilot
	'numToStr/Comment.nvim',
	'tpope/vim-sleuth',
	-- treesitter
	{ 
		'nvim-treesitter/nvim-treesitter', 
		version = false,
		build = ':TSUpdate',
		dependencies = { 'nvim-treesitter/playground' }

	},
	-- vscode like tree
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"kyazdani42/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
	},
	'windwp/nvim-autopairs', -- autopairs
	'mbbill/undotree',
	-- we in here theprimeagen!!
	'theprimeagen/harpoon',

	-- Git related plugins/
	'tpope/vim-fugitive',
	'lewis6991/gitsigns.nvim',
	'f-person/git-blame.nvim',
	{
		'sindrets/diffview.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
	},

	-- which-key
	"folke/which-key.nvim",

	-- fuzzy finder
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                              , branch = '0.1.1',
		dependencies = { 
			'nvim-lua/plenary.nvim',
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
			require("telescope").load_extension("fzf")
			end
		}
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
		-- useful status updates for LSP
		'j-hui/fidget.nvim',

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},         -- Required
		{'hrsh7th/cmp-nvim-lsp'},     -- Required
		{'hrsh7th/cmp-buffer'},       -- Optional
		{'hrsh7th/cmp-path'},         -- Optional
		{'saadparwaiz1/cmp_luasnip'}, -- Optional
		{'hrsh7th/cmp-nvim-lua'},     -- Optional

		-- Snippets
		{'L3MON4D3/LuaSnip'},             -- Required
		{'rafamadriz/friendly-snippets'}, -- Optional
	},
},
-- start screen
{
	"goolord/alpha-nvim",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
},

	-- Coc
	{
		'neoclide/coc.nvim', 
		branch = 'release',
	},
	-- syntax
	'posva/vim-vue', --vue
	'fatih/vim-go', -- golang
	'yuezk/vim-js', -- js
	'HerringtonDarkholme/yats.vim',
	'maxmellon/vim-jsx-pretty',
	--  [[ Debugging ]]
	'mfussenegger/nvim-dap',
	'leoluz/nvim-dap-go',
	'rcarriga/nvim-dap-ui',
	'theHamsta/nvim-dap-virtual-text',
	'nvim-telescope/telescope-dap.nvim',
	'folke/neodev.nvim',
	-- toggle term
	 {'akinsho/toggleterm.nvim', version = "*", config = true}

}
require("lazy").setup(plugins, opts)
