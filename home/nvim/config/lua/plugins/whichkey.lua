return {
	{
		"folke/which-key.nvim",
		optional = true,
		opts = {
			defaults = {
				-- custom macros
				["<leader>s"] = { name = "+surround" },
				["<leader>Z"] = { name = "+custom binds" },
			},
		},
	},
}
