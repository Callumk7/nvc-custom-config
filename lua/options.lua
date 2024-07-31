require "nvchad.options"

local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.relativenumber = true

opt.ignorecase = true
opt.smartcase = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
	pattern = "*",
	command = "tabdo wincmd =",
})

-- Remove keymaps (from NvChad)
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.schedule(function()
			vim.keymap.del("n", "<C-c>")
		end)
	end,
})

--snippets
require("luasnip.loaders.from_vscode").lazy_load { paths = "~/.config/nvim/snippets" }
