-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local group_watcher = vim.api.nvim_create_augroup("FileWatch", {})

-- TODO: make the next two autocmds check if the needed gems
-- are installed before being created
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.erb",
	group = augroup,
	command = "!erblint -a --config ~/.erb-lint.yml %",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.postcss.css",
	group = group_watcher,
	command = "!yarn postcss ./app/assets/stylesheets/application.postcss.css -o ./app/assets/builds/application.css",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.erb",
	group = augroup,

	command = "!htmlbeautifier %",
})

--TODO: fix this path
--
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "ruby",
-- 	group = vim.api.nvim_create_augroup("RubyLSP", { clear = true }), -- also this is not /needed/ but it's good practice
-- 	callback = function()
-- 		vim.lsp.start({
-- 			name = "standard",
-- 			cmd = { "/nix/store/q6kdi6isxbl98091a92ipmm4s300mdb3-standard-1.30.1/bin/standardrb", "--lsp" },
-- 		})
-- 	end,
-- })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	group = vim.api.nvim_create_augroup("LuaLsp", { clear = true }), -- also this is not /needed/ but it's good practice
	callback = function()
		vim.lsp.start({
			name = "lua_ls",
			cmd = { "/nix/store/bjwkgsqpgra2jrkdrgrz04frvp8zvjpi-lua-language-server-3.6.25/bin/lua-language-server" },
		})
	end,
})
