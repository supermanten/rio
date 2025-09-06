-- lua/nvchad/colorify/utils.lua

local M = {}
local api = vim.api
local get_extmarks = api.nvim_buf_get_extmarks
local conf = require("nvconfig").colorify -- Requires your nvconfig.lua
local ns = require("nvchad.colorify.state").ns

--- Checks if a given hex color is dark.
function M.is_dark(hex)
	hex = hex:gsub("#", "")

	local r, g, b = tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
	local brightness = (r * 299 + g * 587 + b * 114) / 1000

	return brightness < 128
end

--- Adds a new highlight group based on a hex color.
function M.add_hl(hex)
	local name = "hex_" .. hex:sub(2)

	if api.nvim_get_hl(0, { name = name }).fg then
		return name
	end

	local fg, bg = hex, hex

	if conf.mode == "bg" then
		fg = M.is_dark(hex) and "white" or "black"
	else
		bg = "none"
	end

	api.nvim_set_hl(0, name, { fg = fg, bg = bg, default = true })
	return name
end

--- Checks if a given range of text needs to be colored.
function M.not_colored(buf, linenr, col, hl_group, opts)
	local ms = get_extmarks(buf, ns, { linenr, col }, { linenr, opts.end_col }, { details = true })

	if #ms == 0 then
		return true
	end

	ms = ms[1]
	opts.id = ms[1]

	return hl_group ~= (ms[4].hl_group or (ms[4].virt_text and ms[4].virt_text[1] and ms[4].virt_text[1][2]))
end

return M
