-- yank
vim.api.nvim_set_option_value("clipboard", "unnamedplus", {})
vim.keymap.set({ "n", "x" }, "cc", '"+y')
vim.keymap.set({ "n", "x" }, "cp", '"+p')

local opts = { noremap = true, silent = true }

-- activate panes
vim.keymap.set("n", "<C-Left>", "<C-w>h", opts)
vim.keymap.set("n", "<C-Down>", "<C-w>j", opts)
vim.keymap.set("n", "<C-Up>", "<C-w>k", opts)
vim.keymap.set("n", "<C-Right>", "<C-w>l", opts)

-- resize panes
vim.keymap.set("n", "<C-h>", ":resize +1<CR>", opts)
vim.keymap.set("n", "<C-j>", ":resize -1<CR>", opts)
vim.keymap.set("n", "<C-k>", ":vertical resize -1<CR>", opts)
vim.keymap.set("n", "<C-l>", ":vertical resize +1<CR>", opts)
