return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    cmd = "Neogit",
    branch = "master",
    keys = { { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit" } },
    opts = {
      integrations = {
        diffview = true,
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
      "DiffviewFileHistory",
    },
    keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" } },
  },
  { "f-person/git-blame.nvim" },
  {
    "sindrets/diffview.nvim",
    keys = {
      {
        "<leader>gD",
        "<cmd>DiffviewClose<cr>",
        desc = "DiffView Close",
      },
      {
        "<leader>gH",
        "<cmd>DiffviewFileHistory<cr>",
        desc = "DiffView History",
      },
    },
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },
  { "FabijanZulj/blame.nvim", cmd = "BlameToggle" },
}
