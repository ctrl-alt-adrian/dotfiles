return {
  -- add extra languages to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "rust",
        "tsx",
        "typescript",
        "vue",
      })
    end,
  },
}
