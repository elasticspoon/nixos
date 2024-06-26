return {
	-- lazy.nvim
	{
		"m4xshen/hardtime.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {
			-- Remove <Up> keys and append <Space> to the disabled_keys
			disabled_keys = {
				["<Up>"] = {},
				["<Left>"] = {},
				["<Right>"] = {},
				["<Down>"] = {},
			},
		},
	},
	{
		"tris203/precognition.nvim",
		event = "VeryLazy",
		config = {
			-- startVisible = true,
			showBlankVirtLine = false,
			-- highlightColor = "Comment",
			hints = {
				Caret = { text = "^", prio = 0 },
				Dollar = { text = "$", prio = 0 },
				MatchingPair = { text = "%", prio = 0 },
				Zero = { text = "0", prio = 0 },
				w = { text = "w", prio = 0 },
				b = { text = "b", prio = 0 },
				e = { text = "e", prio = 0 },
				W = { text = "W", prio = 0 },
				B = { text = "B", prio = 0 },
				E = { text = "E", prio = 0 },
			},
			-- gutterHints = {
			--     -- prio is not currently used for gutter hints
			--     G = { text = "G", prio = 1 },
			--     gg = { text = "gg", prio = 1 },
			--     PrevParagraph = { text = "{", prio = 1 },
			--     NextParagraph = { text = "}", prio = 1 },
			-- },
		},
	},
}
