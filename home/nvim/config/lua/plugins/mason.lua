function getOsServers()
	local serverInstalls = {
		"shfmt",
		"erb-lint",
		"htmlbeautifier",
		"css-lsp",
		"html-lsp",
	}

	if os.getenv("NIX_PATH") == nil and os.getenv("NIX_STORE") == nil then
		vim.list_extend(serverInstalls, {
			"stylua",
		})
	end
	return serverInstalls
end

return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = getOsServers(),
		},
	},
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	opts = {
	-- 		servers = {
	-- 			standardrb = {
	-- 				cmd = {
	-- 					"/nix/store/q6kdi6isxbl98091a92ipmm4s300mdb3-standard-1.30.1/bin/standardrb",
	-- 					"--lsp",
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- },
}
