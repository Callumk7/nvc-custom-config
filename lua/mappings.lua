require "nvchad.mappings"

local map = vim.keymap.set

-- shortcuts
map("i", "jk", "<ESC>", { nowait = true })
map("n", "<leader>Q", ":q<CR>", { desc = "command close" })
map("n", "<leader>hc", ":nohl<CR>", { desc = "clear highlights" })
map("n", "<leader>O", ":normal o<CR>", { desc = "insert line" })

-- tabs
map("n", "<leader>tn", ":tabnew<CR>")

-- ui
map("n", "<leader><leader>t", function()
	require("base46").toggle_transparency()
end)

-- Improvements to document navigation
map("n", "<C-d>", "<C-d>zz", { desc = "scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "scroll up" })
map("n", "G", "Gzz", { desc = "go to bottom and center" })
map("n", "<C-f>", "10jzz", { desc = "gentle scroll down" })
map("n", "<C-y>", "10fzz", { desc = "gentle scroll up" })

-- Tmux Navigate mappings
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")

--LSP mappings
map("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>")
map("n", "ca", "<cmd>Lspsaga code_action<CR>")
map("n", "gf", "<cmd>Lspsaga finder<CR>")
map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")
map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")

map("n", "<leader>xa", "<cmd>Lspsaga show_workspace_diagnostics<CR>")
map("n", "<leader>xb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
map("n", "<leader>xc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

map("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
map("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
map("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

map("n", "<leader>rr", "<cmd>Lspsaga rename<CR>")
map("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- Bufferline commands
local function close_buffer()
	require("nvchad.tabufline").close_buffer()
end
map("n", "<leader>q", close_buffer, { desc = "close the current buffer" })
local function close_all_buffers()
	require("nvchad.tabufline").closeAllBufs()
end
map("n", "<leader><leader>q", close_all_buffers)

--term
map({ "n", "t" }, "<leader>I", function()
	require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Terminal Toggle Floating term", nowait = true })

-- Move highlighted lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Paste below
map("v", "yp", "y']p", { desc = "copy and paste below" })

-- Todo plugin mappings
map("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })
map("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
map("n", "<leader>ft", "<cmd> TodoTelescope<CR>")
map("n", "<leader>tt", "<cmd> Trouble todo<CR>", { noremap = true, silent = true })

map("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
map("v", "<leader>hs", ":Gitsigns stage_hunk<CR>")
map("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
map("v", "<leader>hr", ":Gitsigns reset_hunk<CR>")
map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>")
map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")
map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
map("n", "<leader>hb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
map("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>")
map("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
map("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>")

-- arrow mappings
vim.keymap.set("n", "H", require("arrow.persist").previous)
vim.keymap.set("n", "L", require("arrow.persist").next)
vim.keymap.set("n", "<C-s>", require("arrow.persist").toggle)
