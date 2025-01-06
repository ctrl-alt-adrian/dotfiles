return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-treesitter/nvim-treesitter",
    "theHamsta/nvim-dap-virtual-text",
    "mxsdev/nvim-dap-vscode-js",
  },

  config = function()
    require("dap-vscode-js").setup({
      debugger_path = "~/.local/share/lvim/mason/packages/js-debug-adapter",
      debugger_cmd = { "js-debug-adapter" },
      adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
      node_path = "node",
    })
    local dap = require("dap")

    -- setup the adapter
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
      args = { os.getenv("HOME") .. "/Developer/gitclones/vscode-chrome-debug/out/src/chromeDebug.js" },
    }

    for _, language in ipairs({ "typescript", "javascript", "vue", "svelte" }) do
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

        -- Divider for the launch.json derived configs
        {
          name = "----- ↓ launch.json configs ↓ -----",
          type = "",
          request = "launch",
        },
      }

      --- golang
      dap.adapters.go = {
        type = "executable",
        command = "node",
        args = { os.getenv("HOME") .. "/Developer/gitclones/vscode-go/extension/dist/debugAdapter.js" },
      }
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
    end

    --
    -- load mason-nvim-dap here, after all adapters have been setup
    if LazyVim.has("mason-nvim-dap.nvim") then
      require("mason-nvim-dap").setup(LazyVim.opts("mason-nvim-dap.nvim"))
    end

    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

    for name, sign in pairs(LazyVim.config.icons.dap) do
      sign = type(sign) == "table" and sign or { sign }
      vim.fn.sign_define(
        "Dap" .. name,
        { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
      )
    end

    -- setup dap config by VsCode launch.json file
    local vscode = require("dap.ext.vscode")
    local json = require("plenary.json")
    vscode.json_decode = function(str)
      return vim.json.decode(json.json_strip_comments(str))
    end
  end,
}
