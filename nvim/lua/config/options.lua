-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
--
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.clipboard = "unnamedplus" -- set vim to use system clipboard
opt.list = false -- hide invisible characters
