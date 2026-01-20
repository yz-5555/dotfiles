return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("*", {})

			vim.lsp.config("lua_ls", {
				filetypes = { "lua" },
				single_file_support = true,
				root_markers = { ".luarc.json", ".git" },
			})
			vim.lsp.config("pyright", {
				cmd = { "pyright-langserver", "--stdio" },
				filetypes = { "python" },
				single_file_support = true,
				root_markers = {
					"pyproject.toml",
					"setup.py",
					"setup.cfg",
					"requirements.txt",
					"Pipfile",
					"pyrightconfig.json",
					".git",
				},
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "openFilesOnly",
						},
					},
				},
			})
			vim.lsp.config("clangd", {
				cmd = {
					"clangd",
					-- "--fallback-style=llvm",
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
					vim.keymap.set("n", "gD", function()
						vim.lsp.buf.declaration()
						vim.cmd("noh")
					end, opts)
					vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, opts)
				end,
			})

			vim.lsp.enable({
				"lua_ls",
				"pyright",
				"clangd",
				"zls",
			})
		end,
	},
}
