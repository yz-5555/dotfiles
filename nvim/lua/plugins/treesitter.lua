return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = { "lua", "javascript", "c", "cpp", "rust", "zig" },
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					disable = { "rust" },
				},
				additional_vim_regex_highlighting = { enable = false },
				indent = {
					enable = true,
					disable = { "rust", "c" },
				},
			})
		end,
	},
}
