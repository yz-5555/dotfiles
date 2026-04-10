return {
	{
		"folke/trouble.nvim",
		opts = {
			modes = {
				symbols = {
					win = {
						type = "split",
						relative = "win",
						position = "right",
						size = 0.3,
					},
				},
				lsp = {
					win = {
						type = "split",
						relavtive = "win",
						position = "right",
						size = 0.3,
					},
				},

			},
		},
		cmd = "Trouble",
		keys = {
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
		},
	},
}
