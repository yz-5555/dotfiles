return {
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup({
				themes = { "rasmus", "vesper" },
				livePreivew = true,
			})
		end,
	},
	{
		"kvrohit/rasmus.nvim",
		priority = 1000,
		config = function()
			-- vim.g.rasmus_variant = "monochrome"
			vim.g.rasmus_italic_functions = false
			vim.g.rasmus_italic_comments = false
			vim.g.rasmus_italic_keywords = false
			vim.g.rasmus_italic_variables = false
			vim.g.rasmus_italic_booleans = false

			vim.cmd([[colorscheme rasmus]])
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "rasmus",
				callback = function()
					local variants = require("rasmus.colors")
					local cfg = require("rasmus.config").config
					local c = variants[cfg.variant]

					-- :Inspect or :InspectTree to see these tokens.
					vim.api.nvim_set_hl(0, "Function", { fg = c.blue })
					vim.api.nvim_set_hl(0, "Type", { italic = false })
					vim.api.nvim_set_hl(0, "Identifier", { fg = c.bright_white })
					vim.api.nvim_set_hl(0, "Macro", { bold = true, italic = false })
					vim.api.nvim_set_hl(0, "Special", { fg = c.bright_magenta, italic = false })
					vim.api.nvim_set_hl(0, "@constructor.lua", { fg = c.blue, italic = false })
					vim.api.nvim_set_hl(0, "Keyword", { fg = c.bright_magenta })
					vim.api.nvim_set_hl(0, "@keyword.operator.c", { fg = c.yellow })
					-- struct / class
					vim.api.nvim_set_hl(0, "@type.c", { fg = c.bright_yellow })
					vim.api.nvim_set_hl(0, "@type.cpp", { fg = c.bright_yellow })
					-- diagnostics
					vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg = c.red, underline = true })
					vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { fg = c.yellow, underline = true })
					vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { fg = c.blue, underline = true })
					vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { fg = c.cyan, underline = true })
				end,
			})
		end,
	},
	{
		"datsfilipe/vesper.nvim",
		config = function()
			require("vesper").setup({
				italics = {
					comments = false, -- Boolean: Italicizes comments
					keywords = false, -- Boolean: Italicizes keywords
					functions = false, -- Boolean: Italicizes functions
					strings = false, -- Boolean: Italicizes strings
					variables = false, -- Boolean: Italicizes variables
				},
			})
		end,
	},
}
