-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local opts = { noremap = true, silent = true }
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)
-- vscode code text selection
vim.keymap.set("n", "<S-up>", "<S-v>k", opts)
vim.keymap.set("n", "<S-down>", "<S-v>j", opts)
vim.keymap.set("i", "<S-up>", "<c-o><S-v>k", opts)
vim.keymap.set("i", "<S-down>", "<c-o><S-v>j", opts)
vim.keymap.set("v", "<S-up>", "<up>", opts)
vim.keymap.set("v", "<S-down>", "<down>", opts)
