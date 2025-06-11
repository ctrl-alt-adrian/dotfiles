-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.relativenumber = false
opt.expandtab = true
opt.smartindent = true
opt.wrap = false -- no line wrap
-- enable mouse mode
opt.mouse = "a"
-- don't show the mode since it's already in the statusline
opt.showmode = false

-- no swap file and undotree backup
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true -- save undo history
opt.cursorline = true -- show which line your cursor is on
-- search highlights
opt.hlsearch = false
opt.incsearch = true
-- case insitive search
opt.ignorecase = true
opt.smartcase = true
-- enable break indent
opt.breakindent = true

opt.scrolloff = 8 -- minimal number of screen lines to keep above/below the cursor
opt.updatetime = 250 -- decreasae updatetime
-- change Vim cursor
opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
opt.shortmess:append({ W = true, I = true, c = true })
-- keep signcolumn on by default
opt.signcolumn = "yes"
opt.smartindent = true
opt.spelllang = { "en" }
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.termguicolors = true
opt.showcmd = true
-- show substitutions live, as you type
opt.inccommand = "split"
opt.confirm = true -- when performing an operatation that would faile due to unsaved changes in the buffer,  raisae a dialog asking if you wish to save current file(s)

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)
-- decrease mapped sequence wait time
opt.timeoutlen = 300
