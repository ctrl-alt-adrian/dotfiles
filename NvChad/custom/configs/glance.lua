local glance = require("glance")
local actions = glance.actions

local opts = {
	height = 18,
	zindex = 45,
	detached = true,

	preview_win_opts = {
		cursorline = true,
		number = true,
		wrap = true,
	},
	border = {
		enable = true,
		top_char = "―",
		bottom_char = "―",
	},
	list = {
		position = "right",
		width = 0.33,
	},
	theme = {
		enable = true,
		mode = "auto",
	},
	mappings = {
		list = {
			["j"] = actions.next, -- Bring the cursor to the next item in the list
			["k"] = actions.previous, -- Bring the cursor to the previous item in the list
			["<Down>"] = actions.next,
			["<Up>"] = actions.previous,
			["<Tab>"] = actions.next_location, -- Bring the cursor to the next location skipping groups in the list
			["<S-Tab>"] = actions.previous_location, -- Bring the cursor to the previous location skipping groups in the list
			["<C-u>"] = actions.preview_scroll_win(5),
			["<C-d>"] = actions.preview_scroll_win(-5),
			["v"] = actions.jump_vsplit,
			["s"] = actions.jump_split,
			["t"] = actions.jump_tab,
			["<CR>"] = actions.jump,
			["o"] = actions.jump,
			["<leader>l"] = actions.enter_win("preview"), -- Focus preview window
			["q"] = actions.close,
			["Q"] = actions.close,
			["<Esc>"] = actions.close,
			["<C-q>"] = actions.quickfix,
			-- ['<Esc>'] = false -- disable a mapping
		},
		preview = {
			["Q"] = actions.close,
			["<Tab>"] = actions.next_location,
			["<S-Tab>"] = actions.previous_location,
			["<leader>l"] = actions.enter_win("list"), -- Focus list window
		},
	},
	hooks = {},
	folds = {
		fold_closed = "",
		fold_open = "",
		folded = true, -- Automatically fold list on startup
	},
	indent_lines = {
		enable = true,
		icon = "│",
	},
	winbar = {
		enable = true, -- Available strating from nvim-0.8+
	},
}

require("glance").setup(opts)
