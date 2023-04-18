local opts = {

  adapters = {
    require("neotest-go"),
    require("neotest-jest").setup({
      jestCommand = "npm test --",
      jestConfigFile = "custom.jest.config.ts",
      env = { CI = true},
      cwd = function()
        return vim.fn.getcwd()
      end,
    }),
    require("neotest-rust"),
  }
}

return opts
