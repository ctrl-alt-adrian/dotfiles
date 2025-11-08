-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require("which-key")

wk.add({
  { "<leader>o", group = "+opencode" },
  { "<leader>i", group = "+lsp inlay" },
  { "<leader>m", group = "+mcp" },
  { "<leader>r", group = "+repl" },
})

-- ai.lua: copilot
vim.keymap.set({ "i", "n" }, "<leader>ai", function()
  local current_state = vim.lsp.inline_completion.is_enabled()

  if current_state then
    vim.lsp.inline_completion.enable(false)
    vim.notify("AI Suggestions Disabled", vim.log.levels.INFO)
  else
    vim.lsp.inline_completion.enable(true)
    vim.notify("AI Suggestions Enabled", vim.log.levels.INFO)
  end
end, { desc = "Toggle AI Suggestions" })

-- toggler lsp inline completions
vim.keymap.set("i", "<C-y>", function()
  if vim.lsp.inline_completion.get() then
    return ""
  else
    return "<C-y>"
  end
end, { expr = true, desc = "Accept AI Suggestion" })

-- toggle sidekick auto suggestions
vim.keymap.set({ "i", "n" }, "<leader>as", function()
  local ok = pcall(require, "sidekick")
  if not ok then
    vim.notify("Sidekick not available", vim.log.levels.WARN)
    return
  end

  local nes_ok, nes = pcall(require, "sidekick.nes")
  if nes_ok and nes.toggle then
    nes.toggle()
    local state = nes.enabled and "Enabled" or "Disabled"
    vim.notify("Sidekick AI Suggestions " .. state, vim.log.levels.INFO)
  end
end, { desc = "Toggle Sidekick AI Suggestions" })

-- claud-code.lua: claude-code
vim.keymap.set("n", "<leader>aa", "<cmd>ClaudeCode<CR>", { desc = "Claude: Toggle" })
vim.keymap.set("n", "<leader>aC", "<cmd>ClaudeCodeContinue<CR>", { desc = "Claude: Continue" })
vim.keymap.set("n", "<leader>cr", "<cmd>ClaudeCodeResume<CR>", { desc = "Claude: Resume" })
vim.keymap.set("n", "<leader>aV", "<cmd>ClaudeCodeVerbose<CR>", { desc = "Claude: Verbose" })

-- example.lua: telescope
vim.keymap.set("n", "<leader>fp", function()
  require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
end, { desc = "Find Plugin File" })

-- example.lua: typescript
vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { desc = "Organize Imports" })
vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File" })

-- grug-far.lua: grug-far
vim.keymap.set({ "n", "v" }, "<leader>sr", function()
  local grug = require("grug-far")
  local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
  grug.open({
    transient = true,
    prefills = {
      filesFilter = ext and ext ~= "" and "*." .. ext or nil,
    },
  })
end, { desc = "Search and Replace" })

-- iron.lua: iron REPL commands
vim.keymap.set("n", "<space>rs", "<cmd>IronRepl<cr>", { desc = "REPL: Open" })
vim.keymap.set("n", "<space>rr", "<cmd>IronRestart<cr>", { desc = "REPL: Restart" })
vim.keymap.set("n", "<space>rf", "<cmd>IronFocus<cr>", { desc = "REPL: Focus" })
vim.keymap.set("n", "<space>rh", "<cmd>IronHide<cr>", { desc = "REPL: Hide" })

-- leap.lua: leap
vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)", { desc = "Leap Forward to" })
vim.keymap.set("n", "S", "<Plug>(leap-from-window)", { desc = "Leap from Windows" })

-- loverunner.lua: love2d
vim.keymap.set("n", "<leader>lv", "<cmd>LoveRun<cr>", { desc = "Run Love2D" })
vim.keymap.set("n", "<leader>lx", "<cmd>LoveStop<cr>", { desc = "Stop Love2D" })

-- lsp.lua: lsp inlay hints
vim.keymap.set("n", "<leader>ih", function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
end, { desc = "Toggle Inlay Hints" })

-- mcp-hub.lua: mcp hub
vim.keymap.set("n", "<leader>mt", ":MCPHub<CR>", { desc = "Open MCP Hub" })
vim.keymap.set("n", "<leader>mh", ":checkhealth mcphub<CR>", { desc = "Check health" })
vim.keymap.set("n", "<leader>mr", function()
  local hub = require("mcphub").get_hub_instance()
  if hub then
    hub:restart()
  else
    vim.notify("MCPHub not ready", vim.log.levels.WARN)
  end
end, { desc = "Restart Hub" })

-- neovim-tips.lua: neovim tips
vim.keymap.set("n", "<leader>nto", ":NeovimTips<CR>", { desc = "Neovim tips", noremap = true, silent = true })
vim.keymap.set(
  "n",
  "<leader>nte",
  ":NeovimTipsEdit<CR>",
  { desc = "Edit your Neovim tips", noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<leader>nta",
  ":NeovimTipsAdd<CR>",
  { desc = "Add your Neovim tip", noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<leader>nth",
  ":help neovim-tips<CR>",
  { desc = "Neovim tips help", noremap = true, silent = true }
)
vim.keymap.set("n", "<leader>ntr", ":NeovimTipsRandom<CR>", { desc = "Show random tip", noremap = true, silent = true })
vim.keymap.set(
  "n",
  "<leader>ntp",
  ":NeovimTipsPdf<CR>",
  { desc = "Open Neovim tips PDF", noremap = true, silent = true }
)

-- snacks-gh.lua: github
vim.keymap.set("n", "<leader>gi", function()
  Snacks.picker.gh_issue()
end, { desc = "GitHub Issues (open)" })
vim.keymap.set("n", "<leader>gI", function()
  Snacks.picker.gh_issue({ state = "all" })
end, { desc = "GitHub Issues (all)" })
vim.keymap.set("n", "<leader>gp", function()
  Snacks.picker.gh_pr()
end, { desc = "GitHub Pull Requests (open)" })
vim.keymap.set("n", "<leader>gP", function()
  Snacks.picker.gh_pr({ state = "all" })
end, { desc = "GitHub Pull Requests (all)" })

-- symbols.lua: symbols-outline
vim.keymap.set("n", "<leader>cs", "<cmd>SymbolsOutline<cr>", { desc = "Symbols Outline" })
