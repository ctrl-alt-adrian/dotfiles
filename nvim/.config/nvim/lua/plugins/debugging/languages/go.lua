local dap = require("dap")

-- setup adapters
dap.adapters.go = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/Developer/gitclones/vscode-go/extension/dist/debugAdapter.js" },
}
-- define lanage config
dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    showLog = false,
    program = "${file}",
    dlvToolPath = vim.fn.exepath("dlv"), -- Adjust to where delve is installed
  },
}
