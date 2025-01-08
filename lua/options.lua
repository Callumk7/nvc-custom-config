require "nvchad.options"

local autocmd = vim.api.nvim_create_autocmd
local usrcmd = vim.api.nvim_create_user_command
local opt = vim.opt
local hl = vim.api.nvim_set_hl

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

-- highlight customisations

-- TS utility
usrcmd("TSHighlightCapturesUnderCursor", function()
	local result = vim.treesitter.get_captures_at_cursor(0)
	print(vim.inspect(result))
end, {})

-- auto-remove unused imports when saving a file
usrcmd("RemoveUnusedImports", function()
	vim.lsp.buf.code_action {
		apply = true,
		context = {
			only = { "source.removeUnusedImports.ts" },
			diagnostics = {},
		},
	}
end, {})

-- highlights
hl(0, "FlashLabel", { fg = "#0f0f14", bg = "#ff9e64" })

-- set markdown highlight for mdx file
autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.mdx" },
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
	end,
})

-- Restore cursor position on open
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})
