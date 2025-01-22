return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"folke/trouble.nvim",
	},
	config = function()
		local lualine = require("lualine")
		lualine.setup({
			options = {
				theme = "auto",
			},
		})
	end,
}
