local opts = {
	adapters = { -- add test adapters here
		-- 		require("neotest-rust"),
		require("neotest-go"),
		require("neotest-jest")({
			jestCommand = "npm test --",
			jestConfigFile = "custom.jest.config.ts",
			env = { CI = true },
			cwd = function()
				return vim.fn.getcwd()
			end,
		}),
	},
}

require("neotest").setup(opts)
