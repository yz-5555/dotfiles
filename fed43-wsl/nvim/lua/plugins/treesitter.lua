return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "master",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = { "lua", "python", "javascript", "c", "cpp", "rust", "zig" },
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					disable = { "rust" },
				},
				additional_vim_regex_highlighting = false,
				indent = {
					enable = true,
					disable = { "rust", "c" },
				},
			})
		end,
	},
}
