return {
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
      -- level = vim.log.levels.WARN, -- help vim.log.levels
      render = "minimal",
      stages = "static",
    },
    checker = {
      -- automatically check for plugin updates
      enabled = false,
      concurrency = nil, ---@type number? set to 1 to check for updates very slowly
      notify = true, -- get a notification when new updates are found
      frequency = 3600, -- check for updates every hour
      check_pinned = false, -- check for pinned packages that can't be updated
    },
  },
}
