-- set guicolors
vim.g.doom_one_terminal_colors = true
vim.cmd("colorscheme doom-one")
-- config paths
require("settings")
require("mappings")
require("config")
require("plugins")
