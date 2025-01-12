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
    command = "js-debug-adapter",
    args = { "${port}" },
  },
}

dap.adapters["pwa-chrome"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = { vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "${port}" },
  },
}
-- define langage configurations
for _, language in ipairs(languages) do
  dap.configurations[language] = {
    -- debug single nodejs files
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Current File (pwa-node)",
      cwd = "${workspaceFolder}",
      args = { "${file}" },
      sourceMaps = true,
      protocol = "inspector",
    },
    -- debug nodejs processes (make sure to add --inspect when you run the process)
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach to existing Debug session",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
      sourceMaps = true,
    },
    -- debug web applications (client side)
    -- {
    --   type = "pwa-chrome",
    --   request = "launch",
    --   name = "Launch & Debug Chrome",
    --   url = function()
    --     local co = coroutine.running()
    --     return coroutine.create(function()
    --       vim.ui.input({
    --         prompt = "Enter URL: ",
    --         default = "http://localhost:3000",
    --       }, function(url)
    --         if url == nil or url == "" then
    --           return
    --         else
    --           coroutine.resume(co, url)
    --         end
    --       end)
    --     end)
    --   end,
    --   webRoot = vim.fn.getcwd(),
    --   protocol = "inspector",
    --   sourceMaps = true,
    --   userDataDir = false,
    -- },
    --
    {
      type = "pwa-chrome",
      request = "attach",
      name = "Attach Program (pwa-chrome, select port)",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = function()
        return vim.fn.input("Select port: ", 9222)
      end,
      webRoot = "${workspaceFolder}",
      skipFiles = { "<node_internals>/**", "node_modules/**", "${workspaceFolder}/node_modules/**" },
      resolveSourceMapLocations = {
        "${webRoot}/*",
        "${webRoot}/apps/**/**",
        "${workspaceFolder}/apps/**/**",
        "${webRoot}/packages/**/**",
        "${workspaceFolder}/packages/**/**",
        "${workspaceFolder}/*",
        "!**/node_modules/**",
      },
    },
    -- Divider for the launch.json derived configs
    {
      name = "----- ↓ launch.json configs ↓ -----",
      type = "",
      request = "launch",
    },
  }
end
