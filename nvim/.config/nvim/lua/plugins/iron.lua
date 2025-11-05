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
          send_motion = "<space>sc",
          visual_send = "<space>sc",
          send_file = "<space>sf",
          send_line = "<space>sl",
          send_mark = "<space>sm",
          mark_motion = "<space>mc",
          mark_visual = "<space>mc",
          remove_mark = "<space>md",
          cr = "<space>s<cr>",
          interrupt = "<space>s<space>",
          exit = "<space>sq",
          clear = "<space>cl",
        },
        highlight = { italic = true },
        ignore_blank_lines = true,
      }
    end,
    config = function(_, opts)
      require("iron.core").setup(opts)
    end,
    keys = {
      { "<space>rs", "<cmd>IronRepl<cr>", desc = "REPL: Open" },
      { "<space>rr", "<cmd>IronRestart<cr>", desc = "REPL: Restart" },
      { "<space>rf", "<cmd>IronFocus<cr>", desc = "REPL: Focus" },
      { "<space>rh", "<cmd>IronHide<cr>", desc = "REPL: Hide" },
    },
  },
}
