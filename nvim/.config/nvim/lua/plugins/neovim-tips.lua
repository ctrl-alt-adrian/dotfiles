return {
  "saxon1964/neovim-tips",
  version = "*", -- Only update on tagged releases
  lazy = false, -- Load on startup (recommended for daily tip feature)
  dependencies = {
    "MunifTanjim/nui.nvim",
    -- OPTIONAL: Choose your preferred markdown renderer (or omit for raw markdown)
    "MeanderingProgrammer/render-markdown.nvim", -- Clean rendering
    -- OR: "OXY2DEV/markview.nvim", -- Rich rendering with advanced features
  },
  opts = {
    user_file = vim.fn.stdpath("config") .. "/neovim_tips/user_tips.md",
    user_tip_prefix = "[User] ",
    warn_on_conflicts = true,
    daily_tip = 1,
    bookmark_symbol = "🌟 ",
  },
}
