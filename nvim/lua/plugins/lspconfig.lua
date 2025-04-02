return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			local on_attach = function(client, bufnr)
				local opts = { buffer = bufnr, silent = true }
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			end

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				root_dir = lspconfig.util.root_pattern(".git", ".luarc.json"),
			})
			lspconfig.clangd.setup({
				cmd = {
					"clangd",
					"--fallback-style=llvm",
					"--background-index",
				},
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "c", "cpp" },
				single_file_support = true,
				root_dir = lspconfig.util.root_pattern(".git", ".clangd"),
			})
			lspconfig.neocmake.setup({
				cmd = {
					"neocmakelsp",
					"--stdio",
				},
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "cmake" },
				single_file_support = true,
				root_dir = function(fname)
					return lspconfig.util.find_git_ancestor(fname)
				end,
				init_options = {
					format = {
						enable = true,
					},
					lint = {
						enable = true,
					},
					scan_cmake_in_package = true,
				},
			})
			lspconfig.zls.setup({
				cmd = { "zls" },
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "zig" },
				root_dir = lspconfig.util.root_pattern(".git", "build.zig"),
			})
		end,
	},
}
