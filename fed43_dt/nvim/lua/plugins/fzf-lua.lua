return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		config = function()
			local fzf_lua = require("fzf-lua")

			vim.keymap.set("n", "<C-p>", fzf_lua.files, {})
			vim.keymap.set("n", "<C-d>", function()
				fzf_lua.diagnostics_workspace({ multiline = false })
			end, {})
			vim.keymap.set("n", "<leader>fg", fzf_lua.live_grep, {})
			vim.keymap.set("n", "<leader>rg", fzf_lua.registers, {})
			vim.keymap.set("n", "<leader>gs", fzf_lua.git_status, {})

			vim.keymap.set("n", "<leader>qf", fzf_lua.quickfix, {})

			vim.keymap.set({ "n", "v" }, "ca", function()
				fzf_lua.lsp_code_actions({ silent = true })
			end, {})
		end,
	},
}
