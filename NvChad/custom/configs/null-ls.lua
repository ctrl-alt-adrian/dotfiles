local null_ls = require "null-ls"
local format = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  -- lua
   format.stylua,
   lint.shellcheck,
  -- webdev
  format.prettier.with { filetypes = {"html", "markdown", "css"}},
  --cpp
  format.clang_format,
}

null_ls.setup {
   debug = true,
   sources = sources,
}
