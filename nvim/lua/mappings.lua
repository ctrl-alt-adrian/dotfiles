-- keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- set leader to space
vim.g.mapleader = " "
-- mappings
map("n", "<c-s>", ":w<CR>", {})
map("i", "<c-s>", "<Essc>:w<CR>a", {})
map("n", "zj", "<C-W><C-J>", opts)
map("n", "zh", "<C-W><c-H>", opts)
map("n", "zk", "<C-W><C-K>", opts)
map("n", "zl", "<C-W><C-L>", opts)
map("n", "vs", ":vs<CR>", opts) -- split vertically
map("n", "sp", ":sp<CR>", opts) -- split horizontaltly
-- nvimtree toggle
map("n", "<leader>/", ":NvimTreeToggle<CR>", opts)
-- telescope mappings
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
-- barbar mappings
-- Move to previous/next
map("n", "<A-,>", ":BufferPrevious<CR>", opts)
map("n", "<A-.>", ":BufferNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", ":BufferMovePrevious<CR>", opts)
map("n", "<A->>", " :BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<A-1>", ":BufferGoto 1<CR>", opts)
map("n", "<A-2>", ":BufferGoto 2<CR>", opts)
map("n", "<A-3>", ":BufferGoto 3<CR>", opts)
map("n", "<A-4>", ":BufferGoto 4<CR>", opts)
map("n", "<A-5>", ":BufferGoto 5<CR>", opts)
map("n", "<A-6>", ":BufferGoto 6<CR>", opts)
map("n", "<A-7>", ":BufferGoto 7<CR>", opts)
map("n", "<A-8>", ":BufferGoto 8<CR>", opts)
map("n", "<A-9>", ":BufferGoto 9<CR>", opts)
map("n", "<A-0>", ":BufferLast<CR>", opts)
-- Close buffer
map("n", "<A-c>", ":BufferClose<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
map("n", "<C-p>", ":BufferPick<CR>", opts)
-- Sort automatically by...
map("n", "<Space>bb", ":BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bd", ":BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", ":BufferOrderByLanguage<CR>", opts)
-- Tagbar
map("n", "<F8>", ":TagbarToggle<CR>", opts)
-- Vimspector
map("n", "<leader>da", ":call vimspector#Launch()<CR>", opts)
map("n", "<leader>dx", ":call vimspector#Reset()<CR>", opts)
map("n", "<leader>d_", ":call vimspector#Restart()<CR>", opts)
map("n", "<leader>dn", ":call vimspector#Continue()<CR>", opts)
map("n", "<leader>drc", ":call vimspector#Continue()<CR>", opts)
map("n", "<leader>dh", ":call vimspector#RunToCursor()<CR>", opts)
map("n", "<leader>di", ":call vimspector#ToggleConditionalBreakpoint()<CR>", opts)
map("n", "<leader>dX", ":call vimspector#ClearBreakpoints()<CR>", opts)
-- vs code text selection
map("n", "<S-up>", "<S-v>k", opts)
map("n", "<S-down>", "<S-v>j", opts)
map("i", "<S-up>", "<c-o><S-v>k", opts)
map("i", "<S-down>", "<c-o><S-v>j", opts)
map("v", "<S-up>", "<up>", opts)
map("v", "<S-down>", "<down>", opts)
