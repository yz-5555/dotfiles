vim.lsp.enable({
	"luals",
	"clangd",
	"zls",
})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
