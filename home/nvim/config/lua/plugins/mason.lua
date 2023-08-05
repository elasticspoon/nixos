return {
	{
		"williamboman/mason.nvim",
		opts = function()
			local serverInstalls = {
				ensure_installed = {
					"shfmt",
					"erb-lint",
					"htmlbeautifier",
					"css-lsp",
					"html-lsp",
				},
			}

			if os.getenv("NIX_PATH") == nil then
				vim.list_extend(serverInstalls.ensure_installed, {
					"stylua",
				})
			end
			return serverInstalls
		end,
	},
}
