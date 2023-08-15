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
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				cmd = {
					"/nix/store/bjwkgsqpgra2jrkdrgrz04frvp8zvjpi-lua-language-server-3.6.25/bin/lua-language-server",
				},
			},
		},
	},
}
