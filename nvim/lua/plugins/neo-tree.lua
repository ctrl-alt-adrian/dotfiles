return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
      },
      hide_by_name = {
        --"git",
        --"github",
        --"gitmodules",
        --"thumbs.db",
        --".DS_Store",
      },
    },
  },
}
