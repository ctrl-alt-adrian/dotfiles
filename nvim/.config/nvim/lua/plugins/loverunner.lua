return {
  {
    "S1M0N38/love2d.nvim",
    cmd = { "LoveRun", "LoveStop" }, -- Lazy-load on commands
    opts = {
      restart_on_save = false, -- Optional: Set to true for auto-restart
    },
    keys = {
      { "<leader>lv", "<cmd>LoveRun<cr>", desc = "Run Love2D" },
      { "<leader>lx", "<cmd>LoveStop<cr>", desc = "Stop Love2D" },
    },
  },
}
