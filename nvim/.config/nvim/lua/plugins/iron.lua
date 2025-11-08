return {
  {
    "Vigemus/iron.nvim",
    event = "VeryLazy",
    opts = function()
      local view = require("iron.view")
      return {
        config = {
          scratch_repl = true,
          repl_definition = {
            sh = { command = { "zsh" } },
            javascript = { command = { "node" } },
            typescript = { command = { "npx", "ts-node" } },
            go = { command = { "gore" } },
            python = { command = { "ipython", "--no-autoindent" } },
          },
          repl_open_cmd = view.right(80),
        },
        keymaps = {
          send_motion = "<space>rc",
          visual_send = "<space>rc",
          send_file = "<space>rF",
          send_line = "<space>rl",
          send_mark = "<space>rk",
          mark_motion = "<space>rm",
          mark_visual = "<space>rm",
          remove_mark = "<space>ru",
          cr = "<space>r<cr>",
          interrupt = "<space>ri",
          exit = "<space>rq",
          clear = "<space>rC",
        },
        highlight = { italic = true },
        ignore_blank_lines = true,
      }
    end,
    config = function(_, opts)
      require("iron.core").setup(opts)
    end,
  },
}
