-- install delve
--   go install github.com/go-delve/delve/cmd/dlv@latest
-- install vscode-go
--   git clone https://github.com/golang/vscode-go
--   cd vscode-go/extension
--   npm install
--   npm run compile

local dap = require("dap")

dap.adapters.delve = function(callback, config)
  if config.type == "remote" and config.request == "attach" then
    callback({
      type = "server",
      host = "127.0.0.1",
      port = "port",
    })
  else
    callback({
      type = "server",
      port = "${port}",
      executable = {
        command = "dlv",
        args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
        detatched = vim.fn.has("win32") == 0,
      },
    })
  end
end
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
  {
    type = "go",
    name = "Debug (Build Flags)",
    request = "launch",
    program = "${file}",
    buildFlags = require("dap-go").get_build_flags,
  },
  {
    type = "go",
    name = "Debug (Build Flags & Arguments)",
    request = "launch",
    program = "${file}",
    args = require("dap-go").get_arguments,
    buildFlags = require("dap-go").get_build_flags,
  },
  --- headless mode
  {
    type = "go",
    name = "Attach remote",
    mode = "remote",
    request = "attach",
  },
}
