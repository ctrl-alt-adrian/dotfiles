return {
  {
    "github/copilot.vim",
    optional = true,
    opts = function(_, opts)
      return opts
    end,
    init = function()
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.lsp.inline_completion.enable(false)
        end,
      })
    end,
  },
}
