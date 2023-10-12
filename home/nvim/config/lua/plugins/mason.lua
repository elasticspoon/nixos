-- local function getOsConfig()
-- 	local config = {
-- 	}
--
-- 	if os.getenv("NIX_PATH") == nil and os.getenv("NIX_STORE") == nil then
--     config[servers][]
-- 	end
-- 	return serverInstalls
-- end
local function getOsServers()
	local serverInstalls = {
		"shfmt",
		"erb-lint",
		"htmlbeautifier",
		"css-lsp",
		"html-lsp",
		"bash-language-server",
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
				lua_ls = {
					mason = false,
					cmd = { "lua-language-server" },
				},
				solargraph = {
					mason = false,
					cmd = { "solargraph", "stdio" },
				},
			},
		},
	},
}
