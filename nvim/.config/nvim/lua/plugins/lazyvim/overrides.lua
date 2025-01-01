-- local Util = require("lazyvim.util")
return {

  {
    "folke/which-key.nvim",
    opts = {
      plugins = {
        marks = true, -- show list of your marks on ' and .
        registers = true, -- show your registers on " in Normal or <C-r> in Insert mode
        spelling = {
          enabled = true, -- press z= to select spelling suggestions
          suggestions = 20,
        },
        presets = {
          operators = true, -- adds help for operators like d, y,
          motions = true, -- add help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- mis bindings to work with windows
          z = true, -- bindings for folds, spelling, and others with prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
    },
  },
  -- add gopls and vue-language-server to mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "gopls",
        "vue-language-server",
      })
    end,
  },
  -- have eslint format if lsp is eslint and tssserver if lsp is tsserver
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { eslint = {} },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },
  -- add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
    end,
  },
}
