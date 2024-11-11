-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
    theme = "tokyonight",
	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
		["@keyword.function"] = { bold = true },
		["@keyword.return"] = { bold = true },
		["@keyword"] = { italic = true },
		["@markup.heading"] = { bold = true },
	},

	telescope = {
		style = "bordered",
	},
}

return M
