return {
  "greggh/claude-code.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  init = function()
    vim.opt.splitright = true
  end,
  keys = {
    { "<leader>aa", "<cmd>ClaudeCode<CR>", desc = "Claude: Toggle" },
    { "<leader>aC", "<cmd>ClaudeCodeContinue<CR>", desc = "Claude: Continue" },
    { "<leader>cr", "<cmd>ClaudeCodeResume<CR>", desc = "Claude: Resume" },
    { "<leader>aV", "<cmd>ClaudeCodeVerbose<CR>", desc = "Claude: Verbose" },
  },
  opts = {
    window = {
      position = "vertical",
      split_ratio = 0.3,
      enter_insert = true,
      hide_numbers = true,
      hide_signcolumn = true,
    },
    git = { use_git_root = true },
    refresh = {
      enable = true,
      show_notifications = true,
      updatetime = 100,
      timer_interval = 1000,
    },
    keymaps = {
      toggle = { normal = false, terminal = false },
      window_navigation = true,
      scrolling = true,
    },
  },
  config = function(_, opts)
    local ok, err = pcall(require("claude-code").setup, opts)
    if not ok then
      vim.notify("Failed to setup claude-code.nvim: " .. tostring(err), vim.log.levels.ERROR)
    end
  end,
}
