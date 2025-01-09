return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-treesitter/nvim-treesitter",
    "theHamsta/nvim-dap-virtual-text",
    {
      "mxsdev/nvim-dap-vscode-js",
      tag = "v1.1.0",
    },
    {
      "microsoft/vscode-js-debug",
      tag = "v1.74.1",
      build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    },
  },

  config = function()
    -- # insert configs for languages below
    require("plugins.debugging.languages.cpp")
    require("plugins.debugging.languages.go")
    require("plugins.debugging.languages.python")
    require("plugins.debugging.languages.typescript")

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
