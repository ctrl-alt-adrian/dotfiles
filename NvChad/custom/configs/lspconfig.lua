local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")
-- local util = require "lspconfig/util"

local servers = {"html", "cssls", "clangd", "volar", "gopls", "svelte", "tsserver", "eslint", "emmet_ls", "pyright", "unocss", "jsonls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

