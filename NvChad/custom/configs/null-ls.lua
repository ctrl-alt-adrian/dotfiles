local null_ls = require("null-ls")
local format = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
  sources = {
    -- lua
    format.stylua,
    lint.shellcheck,
    -- webdev
    format.prettier.with({ filetypes = { "html", "markdown", "css", "typescript", "tsx", "javascript" } }),
    --cpp
    format.clang_format,
    -- golang
    format.gofmt,
    format.goimports,
  },
  on_attached = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ "bufnr = bufnr" })
        end,
      })
    end
  end,
}

return opts
