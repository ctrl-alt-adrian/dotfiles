-- install delve
--   go install github.com/go-delve/delve/cmd/dlv@latest
-- install vscode-go
--   git clone https://github.com/golang/vscode-go
--   cd vscode-go/extension
--   npm install
--   npm run compile

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
    dlvToolPath = os.getenv("HOME") .. "/.local/share/mise/installs/go/1.23.4/bin/dlv", -- Adjust to where delve is installed
  },
}
