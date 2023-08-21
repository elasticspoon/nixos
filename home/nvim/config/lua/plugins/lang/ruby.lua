-- NOTE: This is in additon to the built in ruby configuration
-- provided by lazyvim in lazy.init
return {
	{ "tpope/vim-bundler" },
	{ "tpope/vim-rake" },
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
