-- lua/plugins/lsp_signature.lua
return {
	"ray-x/lsp_signature.nvim",
	event = "LspAttach",
	opts = {
		bind = true,

		-- visuals
		hint_enable = false,            -- no inline virtual text
		floating_window = true,         -- use popup
		floating_window_above_cur_line = true,
		handler_opts = { border = "none" }, -- <<< borderless popup
		transparency = nil,             -- set a number 0–100 if you want slight transparency
		max_width = 80,
		max_height = 12,
		zindex = 50,

		-- behavior
		always_trigger = true,          -- keep showing while inside ()
		extra_trigger_chars = { "(", "," }, -- refresh on arg changes (helps some servers)
		auto_close_after = 0,           -- don't auto-close
		fix_pos = false,                -- let it reposition if needed

		-- handy keys
		toggle_key = "<C-s>", -- show/hide on demand
		select_signature_key = "<M-n>",
		move_cursor_key = "<M-m>",
	},
	config = function(_, opts)
		require("lsp_signature").setup(opts)
	end,
}
