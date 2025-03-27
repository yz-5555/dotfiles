return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy", -- or `lspattach`
		priority = 1000, -- needs to be loaded in first
		config = function()
			require("tiny-inline-diagnostic").setup({
				preset = "simple",
				options = {
					multilines = {
						enabled = true,
						always_show = false,
					},
					show_all_diags_on_cursorline = true,
				},
				-- hi = {
				-- 	error = "diagnosticunderlineerror", -- highlight group for error messages
				-- 	warn = "diagnosticunderlinewarn", -- highlight group for warning messages
				-- 	info = "diagnosticunderlineinfo", -- highlight group for informational messages
				-- 	hint = "diagnosticunderlinehint", -- highlight group for hint or suggestion messages
				-- },
			})
			vim.diagnostic.config({
				virtual_text = false,
				signs = true,
				underline = true,
				severity_sort = true,
			})
		end,
	},
}
