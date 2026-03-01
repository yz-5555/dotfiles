vim.diagnostic.config({
	virtual_text = { current_line = true, severity = { min = "INFO", max = "WARN" } },
	virtual_lines = { current_line = true, severity = { min = "ERROR" } },
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = true,
		header = "",
	},
	signs = true,
	underline = true,
	severity_sort = true,
})

vim.keymap.set("n", "df", vim.diagnostic.open_float, {})
