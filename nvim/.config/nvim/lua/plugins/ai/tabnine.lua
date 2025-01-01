return {
  "codota/tabnine-nvim",
  build = "./dl_binaries.sh",
  lazy = false,
  opts = {
    disable_auto_comment = true,
    accept_keymap = "<Tab>",
    dismiss_keymap = "<C-]>",
    debounce_ms = 800,
    suggestion_color = { gui = "#808080", cterm = 244 },
    exclude_filetypes = { "TelescopePrompt" },
  },
  config = function(_, opts)
    require("tabnine").setup(opts)
  end,
}
