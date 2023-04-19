-- override custom configs
local M = {}
local wk = require("which-key")

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "typescript",
    "javascript",
    "tsx",
    "json",
    "rust",
    "c"
  }
}

M.nimtree = {
  filters = {
    dotfiles = true,
    custom = {"node_modules"},
  },

  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.mason = {
  ensure_installed = {
    -- lua
    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettier",
    "emmet-ls",
    "json-lsp",
    "tailwindcss-language-server",

    -- rust
    "rust-analyzer",

    -- c
    "clangd",
    "clang-format",

    -- golang
    "gopls",


  }
}

  M.whichkey = {
  wk.register({
      ["<leader>c"] = {
      name = "Code"
    },
      ["<leader>d"] = {
        name = "Dap"
      },
      ["<leader>f"] = {
        name = "Find"
      },
      ["<leader>g"] = {
        name = "Git"
      },
      ["<leader>l"] = {
        name = "LSP"
      },
      ["<leader>s"] = {
        name = "Spectre"
      },
      ["<leader>t"] = {
      name = "Neotest"
      }
    })
}
return M
