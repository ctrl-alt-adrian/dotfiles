local opts = {

  adapters = {
    require("neotest-jest").setup({
      jestCommand = "npm test --",
    }),
  }
}

return opts
