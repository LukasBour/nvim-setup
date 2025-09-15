vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Remaps for Terminal
vim.keymap.set("n", "<leader>t", vim.cmd.terminal)
-- Remaps for LSP
vim.keymap.set("n", "<leader>d", function()
	vim.diagnostic.open_float(nil, {
		focusable = false,
	})
end, { desc = "Show diagnostic under cursor" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "K",  vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set({ "n","v" }, "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

