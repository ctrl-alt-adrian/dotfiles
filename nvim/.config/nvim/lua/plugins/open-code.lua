return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    { "folke/snacks.nvim", opts = { input = { enabled = true } } },
  },
  config = function()
    vim.g.opencode_opts = {}
    vim.opt.autoread = true

    local opencode = require("opencode")

    -- Ask-related
    vim.keymap.set("n", "<leader>oA", function()
      opencode.ask()
    end, { desc = "Ask: custom prompt" })

    vim.keymap.set("n", "<leader>oa", function()
      opencode.ask("@cursor: ")
    end, { desc = "Ask: about this" })

    vim.keymap.set("v", "<leader>oa", function()
      opencode.ask("@selection: ")
    end, { desc = "Ask: about selection" })

    -- Session-related
    vim.keymap.set("n", "<leader>on", function()
      opencode.command("session_new")
    end, { desc = "Session: new" })

    vim.keymap.set({ "n", "v" }, "<leader>os", function()
      opencode.select()
    end, { desc = "Session: select prompt" })

    -- Misc
    vim.keymap.set("n", "<leader>ot", function()
      opencode.toggle()
    end, { desc = "Toggle" })

    vim.keymap.set("n", "<leader>oy", function()
      opencode.command("messages_copy")
    end, { desc = "Copy last response" })

    vim.keymap.set("n", "<S-C-u>", function()
      opencode.command("messages_half_page_up")
    end, { desc = "Messages half page up" })

    vim.keymap.set("n", "<S-C-d>", function()
      opencode.command("messages_half_page_down")
    end, { desc = "Messages half page down" })

    vim.keymap.set("n", "<leader>oe", function()
      opencode.prompt("Explain @cursor and its context")
    end, { desc = "Explain this code" })
  end,
}
