local overrides = require "custom.configs.overrides"
local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
     "jose-elias-alvarez/null-ls.nvim",
     config = function()
       require "custom.configs.null-ls"
     end,
   },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
   -- overrides default configs
  { "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree},
  { "nvim-treesitter/nvim-treesitter", opts = overrides.treesitter},
  { "williamboman/mason.nvim", opts = overrides.mason},
  { 'nvim-treesitter/playground', lazy = false},
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end
  },
  {
    'saecki/crates.nvim',
    dependencies = "hrsh7th/nvim-cmp",
    ft = {"rust", "toml"},
    config = function(_,opts)
      local crates = require('crates')
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, {names = "crates"})
      return M
    end,
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    lazy = false,
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    lazy = false,
    event = "InsertEnter",
    config = function()
      require("copilot").setup()
    end,
  },
  {
    "f-person/git-blame.nvim",
    lazy = false,
  },
  {
    "codota/tabnine-nvim",
    build = "./dl_binaries.sh",
    lazy = false,
    opts = function()
      return require "custom.configs.tabnine"
    end,
    config = function(_, opts)
      require("tabnine").setup(opts)
    end
  },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    cmd =  {"TroubleToggle", "Trouble"},
    opts = function()
      return require "custom.configs.trouble"
    end,
    config = function(_, opts)
    require("trouble").setup(opts)
    end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
    require("todo-comments").setup()
    end
  },
  {
    'nvim-pack/nvim-spectre',
    dependencies = "nvim-lua/plenary.nvim",

  },
  { 'mbbill/undotree', lazy = false },
  {
    'nvim-neotest/neotest',
    ft = { "rust", "typescript", "javascript", "vue", "tsx", "lua" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go",
      'haydenmeade/neotest-jest',
      "rouge8/neotest-rust",
    },
    opts = function()
      return require "custom.configs.neotest"
    end,
    config = function(_, opts)
     require("neotest").setup(opts)
    end
  },
  {
    "folke/neodev.nvim",
    opts = function()
      return require "custom.configs.neodev"
    end,
    config = function(_, opts)
      require("neodev").setup(opts)
    end,
  }
}

return plugins
