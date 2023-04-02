function SetColor(color)
	color = color or "onedark"
	vim.opt.termguicolors = true
	vim.cmd.colorscheme(color)
end

SetColor()
