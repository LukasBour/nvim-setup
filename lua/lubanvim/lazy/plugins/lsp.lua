return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"pyright",
				"clangd",
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",

			-- Autocompletion and Suggestions
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function(_, opts)
			require("mason").setup()
			require("mason-lspconfig").setup(opts)
			-- capabilities for cmp
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Auto setup for each LSP

			--nvim-cmp setup
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-F>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.select_next_item(
						{ behavior = cmp.SelectBehavior.Insert }
					),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<Esc>"] = cmp.mapping.abort(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				completion = {
					completeopt = "menu,menuone,noinsert,noselect",
				},
				preselect = cmp.PreselectMode.None,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					python = { "isort", "black" },
				},
				format_on_save = {
					timeout_ms = 800,
					lsp_fallback = true,
				},
			})

			conform.formatters.black = {
				prepend_args = { "--line-length", "88" },
			}

			vim.keymap.set({ "n", "v" }, "<leader>f", function()
				conform.format({ async = false, lsp_fallback = true })
			end, { desc = "Format buffer" })
		end
	}
}
