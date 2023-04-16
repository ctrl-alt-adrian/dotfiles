return {
  "nvim-neotest/neotest",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "haydenmeade/neotest-jest",
    {
      "andythigpen/nvim-coverage",
      config = function()
        require("coverage").setup()
      end,
    },
    {
      "stevearc/overseer.nvim",
      config = function()
        require("overseer").setup()
      end,
    },
    "nvim-neotest/neotest-go",
  },
  config = function()
    local opts = {
      diagnostic = {
        enabled = true,
      },
      adapters = {
        require("neotest-jest")({
          jestCommand = "jest --watch",
        }),
      },
      consumer = {
        overseer = require("neotest.consumers.overseer"),
      },
      overseer = {
        enabled = true,
        force_default = true,
      },
    }
    require("neotest").setup(opts)
  end,
  keys = {
    {
      "<leader>ta",
      function()
        require("neotest").run.attach()
      end,
      desc = "Attach",
    },
    {
      "<leader>tr",
      function()
        require("neotest").run.run()
      end,
      desc = "Run Nearest",
    },
    {
      "<leader>tl",
      function()
        require("neotest").run.run_last()
      end,
      desc = "Run Last",
    },
    {
      "<leader>tf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run File",
    },
    {
      "<leader>to",
      function()
        require("neotest").output.open()
      end,
      desc = "Output",
    },
    {
      "<leader>tq",
      function()
        require("neotest").run.stop()
      end,
      desc = "Stop",
    },
    {
      "<leader>ts",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Summary",
    },
  },
}
