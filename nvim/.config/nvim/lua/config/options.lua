-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
-- opt.winbar = "%=%m %f"
-- standard vim configurations here
opt.relativenumber = false
opt.expandtab = true
opt.smartindent = true
opt.wrap = false -- no line wrap

-- no swap file and undotree backup
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.cursorline = true
-- search highlights
opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8
opt.updatetime = 50
-- change Vim cursor
opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
opt.shortmess:append({ W = true, I = true, c = true })
opt.signcolumn = "yes"
opt.smartindent = true
opt.spelllang = { "en" }
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.termguicolors = true
opt.showcmd = true
