local opts = {
adapters = { -- add test adapters here
		require("neotest-rust"),
		require("neotest-go"),
		require("neotest-jest"),
	},
}

require("neotest").setup(opts)
