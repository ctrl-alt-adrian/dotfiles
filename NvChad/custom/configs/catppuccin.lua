local options = {
  flavor = "mocha",
  term_colors = true,
  no_bold = false,
  styles = {
    comments = {},
    conditional = {},
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {"bold"},
  },
  color_ovverides = {
    mocha = {
      base = "#171717", -- background
      surface2 = "#9A9A9A", -- comments
      text = "#F6F6F6",
    }
  }
}

return options
