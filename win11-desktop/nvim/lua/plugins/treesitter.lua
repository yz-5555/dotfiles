return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		local parsers = {
			"bash",
			"comment",
			"css",
			"diff",
			"git_config",
			"gitcommit",
			"gitignore",
			"groovy",
			"html",
			"javascript",
			"jsdoc",
			"json",
			"json5",
			"lua",
			"make",
			"markdown",
			"markdown_inline",
			"python",
			"regex",
			"rust",
			"ssh_config",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		}

		for _, parser in ipairs(parsers) do
			ts.install(parser)
		end

		-- Not every tree-sitter parser is the same as the file type detected
		-- So the patterns need to be registered more cleverly
		local patterns = {}
		for _, parser in ipairs(parsers) do
			local parser_patterns = vim.treesitter.language.get_filetypes(parser)
			for _, pp in pairs(parser_patterns) do
				table.insert(patterns, pp)
			end
		end

		vim.treesitter.language.register("groovy", "Jenkinsfile")
		vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo[0][0].foldmethod = "expr"

		vim.api.nvim_create_autocmd("FileType", {
			pattern = patterns,
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}

-- Thanks to https://mhpark.me/posts/update-treesitter-main/
