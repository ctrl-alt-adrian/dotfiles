return {
  "RRethy/base16-nvim",
  config = function()
    local bg = "#0F1919"
    local accent = "#102121"
    local accent2 = "#0D2525" -- highlight

    local text = "#abb2bf"
    local dark_text = "#3E4451" -- comments, line numbers

    local keyword = "#8F939A"
    local func = "#B6AB8B"
    local types = "#65838E"
    local constant = "#A06057"

    local for_tesing = "#FF0000"

    require("base16-colorscheme").setup({
      base00 = bg,
      base01 = accent,
      base02 = accent2,
      base03 = dark_text,
      base04 = dark_text,
      base05 = text,
      base06 = for_tesing,
      base07 = for_tesing,
      base08 = text,
      base09 = constant,
      base0A = types,
      base0B = constant,
      base0C = text,
      base0D = func,
      base0E = keyword,
      base0F = text,
    })
    -- vim.cmd("colorscheme base16")
  end,
}
