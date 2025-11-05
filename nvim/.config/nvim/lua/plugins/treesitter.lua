return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = { "lua", "typescript", "tsx", "javascript", "json" },
      highlight = { enable = true, additional_vim_regex_highlighting = false },
    },
  },
}
