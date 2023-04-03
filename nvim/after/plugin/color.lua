function SetColor(color)
	color = color or "onedark"
	vim.cmd.colorscheme(color)

	-- remove gb for Normal and Float
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })  
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetColor()
