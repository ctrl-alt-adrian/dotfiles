-- Install local-lua-debugger-vscode
--   git clone https://github.com/tomblind/local-lua-debugger-vscode
--   cd local-lua-debugger-vscode
--   npm install
--   npm run build
local dap = require("dap")
dap.adapters["local-lua"] = {
  type = "executable",
  command = "node",
  -- add this
  args = {
    "/absolute/path/to/local-lua-debugger-vscode/extension/debugAdapter.js",
  },
  enrich_config = function(config, on_config)
    if not config["extensionPath"] then
      local c = vim.deepcopy(config)
      -- 💀 If this is missing or wrong you'll see
      -- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
      -- add this
      c.extensionPath = "/absolute/path/to/local-lua-debugger-vscode/"
      on_config(c)
    else
      on_config(config)
    end
  end,
}
