return {
  "akinsho/toggleterm.nvim",
  config = true,
  cmd = "ToggleTerm",
  keys = { { "<C-t>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" } },
  opts = {
    openmappoing = [[<C-t]],
    direction = "horizontal",
    shade_filetypes = {},
    hide_numbers = true,
    insert_mappings = true,
    terminal_mappings = true,
    start_in_insert = false,
    close_on_exit = false,
  },
}
