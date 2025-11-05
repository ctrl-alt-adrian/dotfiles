return {
  {
    "michaelb/sniprun",
    build = "sh install.sh",
    event = "VeryLazy",
    cmd = { "SnipRun", "SnipReset", "SnipInfo" },
    opts = {
      live_mode_toggle = "off",
      display = { "VirtualTextOk", "VirtualTextErr" },
      display_options = {
        terminal_scrollback = 0,
      },
      selected_interpreters = {},
      repl_enable = {},
      interpreter_options = {
        Go_original = { compiler = "go run" },
        Python3_original = { interpreter = "python3" },
        JavaScript_original = { interpreter = "node" },
        TypeScript_original = { interpreter = "npx ts-node" },
        Rust_original = { compiler = "rustc" },
        Lua_original = { interpreter = "lua" },
      },
    },
    config = function(_, opts)
      require("sniprun").setup(opts)
      vim.schedule(function()
        require("sniprun.display").VirtualText = require("sniprun.display").VirtualText or {}
      end)

      -- Reapply highlight groups explicitly
      vim.api.nvim_set_hl(0, "SniprunVirtualTextOk", { fg = "#98be65", bold = true })
      vim.api.nvim_set_hl(0, "SniprunVirtualTextErr", { fg = "#ec5f67", bold = true })

      -- (Optional) ensure global diagnostics don’t block extmarks
      vim.diagnostic.config({ virtual_text = true })
    end,
  },
}
