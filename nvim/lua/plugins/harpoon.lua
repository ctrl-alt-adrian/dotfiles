return {
  "theprimeagen/harpoon",
  event = "VeryLazy",
  keys = {
    {
      "<leader>a",
      function()
        require("harpoon.mark").add_file()
      end,
      desc = "Harpoon App File",
    },
    {
      "<C-e>",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      desc = "Harpoon Toggle Quick Menu",
    },
    {
      "<leader>Hh",
      function()
        require("harpoon.ui").nav_file(1)
      end,
      desc = "Mark 1",
    },
    {
      "<leader>Ht",
      function()
        require("harpoon.ui").nav_file(4)
      end,
      desc = "Mark 2",
    },
    {
      "<leader>Hn",
      function()
        require("harpoon.ui").nav_file(2)
      end,
      desc = "Mark 3",
    },
    {
      "<leader>Hs",
      function()
        require("harpoon.ui").nav_file(3)
      end,
      desc = "Mark 4",
    },
  },
}
