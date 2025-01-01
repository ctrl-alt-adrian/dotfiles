return {
  -- themes
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "darker",
      transparent = true,
      code_style = {
        keywords = "bold",
        functions = "bold",
        comments = "italic",
      },
      lualine = { transparent = true },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
    -- { "loctvl842/monokai-pro.nvim" },
    -- name = "monokai-pro",
    -- opts = {
    --   transparent_background = true,
    --   integrations = {
    --     notify = true,
    --     mini = true,
    --   },
    --   colorscheme = "monokai-pro",
    -- },
  },
}