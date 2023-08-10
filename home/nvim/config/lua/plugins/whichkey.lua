return {
	{
		"folke/which-key.nvim",
		optional = true,
		opts = {
			defaults = {
				-- custom macros
				["<leader>s"] = { name = "+surround" },
				["<leader>z"] = { name = "+custom binds" },
				["<leader>zb"] = { name = "+blog" },
			},
		},
	},
}
