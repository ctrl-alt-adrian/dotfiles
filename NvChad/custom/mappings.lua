local M = {}
local opts = { silent = true, noremap = true }

M.dap = {
	n = {
		["<leader>db"] = {
			"<cmd> DapToggleBreakpoint <CR>",
			"Toggle breakpoint",
		},
		["<leader>dus"] = {
			function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end,
			"Open debug sidebar",
		},
	},
}

M.dap_go = {
	n = {
		["<leader>dgt"] = {
			function()
				require("dap-go").debug_test()
			end,
			"Debug go test",
		},
		["<leader>dgl"] = {
			function()
				require("dap-go").debug_last()
			end,
			"Debug last go test",
		},
	},
}

M.gopher = {
	n = {
		["<leader>gsj"] = {
			"<cmd> GoTagAdd json <CR>",
			"Add json struct tags",
		},
		["<leader>gsy"] = {
			"<cmd> GoTagAdd yaml <CR>",
			"Add yaml struct tags",
		},
	},
}

M.crates = {
	n = {
		["<leader>rcu"] = {
			function()
				require("crates").upgrade_all_crates()
			end,
			"Update crates",
		},
	},
}

M.trouble = {
	n = {
		["<leader>cx"] = {
			"<cmd> TroubleToggle <CR>",
			"Trouble Toggle",
			opts = opts,
		},
		["<leader>cw"] = {
			"<cmd> TroubleToggle workspace_diagnostics <CR>",
			"Trouble Workspace Diagnostics",
			opts = opts,
		},
		["<leader>cd"] = {
			"<cmd> TroubleToggle document_diagnostics <CR>",
			"Trouble Document Diagnostics",
			opts = opts,
		},
		["<leader>cl"] = {
			"<cmd> TroubleToggle loclist <CR>",
			"Trouble Local List",
			opts = opts,
		},
		["<leader>cq"] = {
			"<cmd> TroubleToggle quickfix <CR>",
			"Trouble QuickFix",
			opts = opts,
		},
		["<leader>cgR"] = {
			"<cmd> TroubleToggle lsp_references <CR>",
			"Trouble LSP References",
			opts = opts,
		},
		["[q"] = {
			function()
				if require("trouble").is_open() then
					require("trouble").previous({ skip_groups = true, jump = true })
				else
					vim.cmd.cprev()
				end
			end,
			"Previous trouble/quickfix item",
		},
		["]q"] = {
			function()
				if require("trouble").is_open() then
					require("trouble").next({ skip_groups = true, jump = true })
				else
					vim.cmd.cnext()
				end
			end,
			"Next trouble/quickfix item",
		},
	},
}

M.spectre = {
	n = {
		["<leader>sr"] = {
			function()
				require("spectre").open()
			end,
			"Replace in files (Spectre)",
		},
	},
}

M.undotree = {
	n = {
		["<leader>u"] = {
			"<cmd> UndotreeToggle <CR>",
			"Undotree Toggle",
		},
	},
}

M.neotest = {
	n = {
		["<leader>ta"] = {
			function()
				require("neotest").run.attach()
			end,
			"Neotest Attach",
		},
		["<leader>tr"] = {
			function()
				require("neotest").run.run()
			end,
			"Neotest Nearest",
		},
		["<leader>tl"] = {
			function()
				require("neotest").run_last()
			end,
			"Neotest Run Last",
		},
		["<leader>tf"] = {
			function()
				require("neotest").run(vim.fn.expand("%"))
			end,
			"Neotest Run File",
		},
		["<leader>to"] = {
			function()
				require("neotest").output.open()
			end,
			"Neotest Output",
		},
		["<leader>tq"] = {
			function()
				require("neotest").run.stop()
			end,
			"Neotest Stop",
		},
		["<leader>ts"] = {
			function()
				require("neotest").summary.toggle()
			end,
			"Neotest Summary",
		},
	},
}

M.glance = {
	n = {
		["gR"] = {
			"<cmd> Glance references<CR>",
			"Glance references",
		},
		["gD"] = {
			"<cmd> Glance definitions<CR>",
			"Glance definitions",
		},
		["gY"] = {
			"<cmd> Glance type_definitions<CR>",
			"Glance type definitions",
		},
		["gM"] = {
			"<cmd> Glance implementations<CR>",
			"Glance implementations",
		},
	},
}

return M
