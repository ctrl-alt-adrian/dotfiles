local dap = require("dap")
local languages = {
  "javascript",
  "typescript",
  "javascriptreact",
  "typescriptreact",
  -- using pwa-chrome
  "vue",
  "svelte",
}

-- setup adapters
dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}", --let both ports be the same for now...
  executable = {
    command = "node",
    -- -- 💀 Make sure to update this path to point to your installation
    args = {
      vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
      "${port}",
    },
  },
}

-- TODO: figure out how to get debugging client side with chrome working
dap.adapters["pwa-chrome"] = {
  type = "server",
  command = "node",
  port = "${port}", --let both ports be the same for now...
  args = {
    os.getenv("HOME") .. "/Developer/gitclones/vscode-js-debug/out/src/vsDebugServer.js",
    "${port}",
  },
}

-- this adapter uses VSCode Chrome debugger since VSCode JS Debugger is not DAP compliant
dap.adapters.chrome = {
  -- executable: launch the remote debug adapter - server: connect to an already running debug adapter
  type = "executable",
  -- command to launch the debug adapter - used only on executable type
  command = "node",
  args = { vim.fn.stdpath("data") .. "/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js" },
}

-- define langage configurations
for _, language in ipairs(languages) do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Current File (pwa-node)",
      cwd = "${workspaceFolder}",
      args = { "${file}" },
      sourceMaps = true,
      protocol = "inspector",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Current File (Typescript)",
      cwd = "${workspaceFolder}",
      runtimeArgs = { "--loader=ts-node/esm" },
      program = "${file}",
      runtimeExecutable = "node",
      sourceMaps = true,
      protocol = "inspector",
      outFiles = { "${workspaceFolder}/**/**/*", "!**/node_modules/**" },
      skipFiles = { "<node_internals>/**", "node_modules/**" },
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach to existing Debug session",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
      sourceMaps = true,
    },
    -- Debug web applications (client side)
    {
      type = "chrome",
      request = "attach",
      name = "Launch & Debug Chrome",
      url = function()
        local co = coroutine.running()
        return coroutine.create(function()
          vim.ui.input({
            prompt = "Enter URL: ",
            default = "http://localhost:3000",
          }, function(url)
            if url == nil or url == "" then
              return
            else
              coroutine.resume(co, url)
            end
          end)
        end)
      end,
      webRoot = "${workspaceFolder}",
      slipFiles = { "<node_internals>/* */.js" },
      protocol = "inspector",
      sourceMaps = true,
      userDataDir = false,
    },
    {
      type = "chrome",
      name = "Debug with Chrome",
      request = "attach",
      reAttach = true,
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      host = "127.0.0.1",
      url = "http://localhost:5173",
      port = 9222,
      webRoot = "${workspaceFolder}",
    },

    -- Divider for the launch.json derived configs
    {
      name = "----- ↓ launch.json configs ↓ -----",
      type = "",
      request = "launch",
    },
  }
end
