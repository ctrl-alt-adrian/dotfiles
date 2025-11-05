return {
  "Vigemus/iron.nvim",
  version = "^3.0",
  config = function()
    require("iron.core").setup({
      repl_definition = {
        javascript = { command = { "node" } },
        typescript = { command = { "npx", "ts-node" } },
        go = { command = { "gore" } },
        python = { command = { "ipython", "--no-autoindent" } },
      },
      repl_open_cmd = require("iron.view").bottom(40),
      keymaps = {
        send_line = "<space>sl",
        send_motion = "<space>sc",
        send_visual = "<space>sv",
        interrupt = "<space>s<space>",
        exit = "<space>sq",
      },
      close_window_on_exit = true,
    })
  end,
}
