return {
  "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
  config = function()
    require("mcphub").setup()
  end,
  keys = {
    { "<leader>mt", ":MCPHub<CR>", desc = "Open MCP Hub" }, -- official UI command
    { "<leader>mh", ":checkhealth mcphub<CR>", desc = "Check health" }, -- health checker
    {
      "<leader>mr",
      function()
        local hub = require("mcphub").get_hub_instance()
        if hub then
          hub:restart()
        else
          vim.notify("MCPHub not ready", vim.log.levels.WARN)
        end
      end,
      desc = "Restart Hub",
    },
  },
}
