return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "mxsdev/nvim-dap-vscode-js",
      { "theHamsta/nvim-dap-virtual-text", opts = {} },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local utils = require("dap.utils")

      -- listeners to automatically open and close dapui
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
      -- vscode-js-debug (js-debug-adapter in Mason)
      --FIXME: Getting JS Debugger exited with code 1 error.  EADDRINUSE:  Fix this.
      require("dap-vscode-js").setup({
        node_path = vim.fn.getenv("HOME") .. "/.local/share/mise/installs/node/latest/bin/node",
        -- debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
        debugger_path = vim.fn.getenv("HOME") .. "/Developer/gitclones/vscode-js-debug",
        debugger_cmd = { "js-debug-adapter" },
        adapters = {
          "pwa-node",
          "pwa-chrome",
          "pwa-msedge",
          "node-terminal",
          "pwa-extensionHost",
        },
      })

      for _, language in ipairs({
        "typescript",
        "javascript",
        "javascriptreact",
        "typescriptreact",
        "vue",
      }) do
        dap.configurations[language] = {
          {
            name = "TS-Node Launch",
            type = "pwa-node",
            request = "launch",
            program = "${file}",
            cwd = "${workspaceFolder}",
            sourceMaps = true,
            protocol = "inspector",
            console = "integratedTerminal",
            resolveSourceMapLocations = {
              "${workspaceFolder}/dist/**/*.js",
              "${workspaceFolder}/**",
              "!**/node_modules/**",
            },
            runtimeExecutable = "${workspaceFolder}/node_modules/.bin/ts-node",
          },
          {
            name = "Node Attach to an existing `node --inspect` process",
            type = "pwa-node",
            request = "attach",
            processId = utils.pick_process,
            cwd = "${workspaceFolder}",
            sourceMaps = true,
            protocol = "inspector",
            console = "integratedTerminal",
            resolveSourceMapLocations = {
              "${workspaceFolder}/dist/**/*.js",
              "${workspaceFolder}/**",
              "!**/node_modules/**",
            },
          },
          {
            name = "Jest Launch",
            type = "pwa-node",
            request = "launch",
            -- trace = true, -- include debugger info
            runtimeExecutable = "node",
            runtimeArgs = {
              "./node_modules/jest/bin/jest.js",
              "--runInBand",
            },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
          },
          {
            request = "launch",
            name = "Deno launch",
            type = "pwa-node",
            program = "${file}",
            cwd = "${workspaceFolder}",
            runtimeExecutable = vim.fn.getenv("HOME") .. "/.local/share/mise/installs/deno/bin/deno",
            runtimeArgs = { "run", "--inspect-brk", "--allow-all" },
            attachSimplePort = 9229,
          },
          {
            request = "launch",
            name = "Deno test launch",
            type = "pwa-node",
            program = "${file}",
            cwd = "${workspaceFolder}",
            runtimeExecutable = vim.fn.getenv("HOME") .. "/.local/share/mise/installs/deno/bin/deno",
            runtimeArgs = { "test", "--inspect-brk", "--allow-all" },
            attachSimplePort = 9229,
          },
          {
            type = "pwa-chrome",
            request = "launch",
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
            webRoot = vim.fn.getcwd(),
            protocol = "inspector",
            sourceMaps = true,
            userDataDir = false,
            port = 9929,
          },
        }
      end
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
    keys = {
      {
        "<leader>dO",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {
      virt_text_win_col = 80,
    },
  },
}
