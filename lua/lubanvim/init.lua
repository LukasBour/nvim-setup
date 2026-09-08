require("lubanvim.lazy.config.lazy")
require("lubanvim.remap")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10

vim.opt.wrap = false

vim.cmd.colorscheme("habamax")

vim.g.netrw_keepdir = 1
vim.opt.autochdir = false

vim.diagnostic.config({
	virtual_text = {
		prefix = vim.fn.nr2char(0xF111),
		source = "if_many",
		spacing = 2,
	},
	signs = true,
	underline = true,
	severity_sort = true,
})
