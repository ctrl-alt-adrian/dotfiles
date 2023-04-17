-- override custom configs
local M = {}

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
return M
