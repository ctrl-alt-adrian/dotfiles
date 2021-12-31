vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_add_trailing = 1
require("nvim-tree").setup({
	auto_open = 1,
	auto_close = 1,
	diagnostics = {
		enable = true,
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
})
