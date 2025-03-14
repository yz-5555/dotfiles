return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		config = function()
			local fzf_lua = require("fzf-lua")
			local f = 5

			vim.keymap.set("n", "<C-p>", fzf_lua.files, {})
			vim.keymap.set("n", "<C-d>", fzf_lua.lsp_workspace_diagnostics, {})

			vim.keymap.set("n", "<leader>fg", fzf_lua.live_grep, {})
			vim.keymap.set("n", "<leader>rg", fzf_lua.registers, {})
			vim.keymap.set("n", "<leader>gs", fzf_lua.git_status, {})
			vim.keymap.set("n", "<leader>gq", fzf_lua.grep_quickfix, {})
			vim.keymap.set("n", "<leader>ql", fzf_lua.quickfix, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", fzf_lua.lsp_code_actions, {})
		end,
	},
}
