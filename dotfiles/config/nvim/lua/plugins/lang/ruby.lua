-- NOTE: This is in additon to the built in ruby configuration
-- provided by lazyvim in lazy.init
local lspconfig = require("lspconfig")

return {
	-- { "tpope/vim-bundler" },
	-- { "tpope/vim-rake" },
	-- { "vim-ruby/vim-ruby" },
	{
		"tpope/vim-rails",
		cmd = {
			"Eview",
			"Econtroller",
			"Emodel",
			"Smodel",
			"Sview",
			"Scontroller",
			"Vmodel",
			"Vview",
			"Vcontroller",
			"Tmodel",
			"Tview",
			"Tcontroller",
			"Rails",
			"Generate",
			"Runner",
			"Extract",
		},
	},
}
