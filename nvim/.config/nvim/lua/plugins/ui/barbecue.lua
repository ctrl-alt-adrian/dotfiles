return {
  "utilyre/barbecue.nvim",
  event = "LspAttach",
  dependencies = { "SmiteshP/nvim-navic" },
  opts = {
    create_autocmd = false,
    attach_navic = false,
  },
}
