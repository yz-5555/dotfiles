return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("*", {})

			vim.lsp.config("lua_ls", {
				single_file_support = true,
				filetypes = { "lua" },
				root_markers = { ".luarc.json", ".git" },
			})
			vim.lsp.config("clangd", {
				cmd = {
					"clangd",
					"--fallback-style=llvm",
					"--background-index",
				},
				filetypes = { "c", "cpp" },
				single_file_support = true,
				root_markers = { ".clangd", ".git" },
			})
			vim.lsp.config("zls", {
				cmd = { "zls" },
				filetypes = { "zig" },
				single_file_support = true,
				root_markers = { "build.zig", ".git" },
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local opts = { buffer = event.buf, silent = true }

					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "gd", function()
						vim.lsp.buf.definition()
						vim.cmd("noh")
					end, opts)
					vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, opts)
				end,
			})

			vim.lsp.enable({
				"lua_ls",
				"clangd",
				"zls",
			})
		end,
	},
}
