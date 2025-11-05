return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      go = { "gofumpt", "goimports" },
      sh = { "shfmt" },
      lua = { "stylua" },
    },
    -- 👇 this makes Conform prefer external formatters instead of LSP/null-ls
    default_format_opts = {
      lsp_format = "never",
    },
  },
}
