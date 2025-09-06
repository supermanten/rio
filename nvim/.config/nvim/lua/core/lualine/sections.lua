local lazy_status = require("lazy.status")

local M = {}

M.active = {
	lualine_a = {
		{ "mode", icon = " ", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
	},
	lualine_b = {
		{ "branch", icon = " ", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
	},
	lualine_c = {
		{
			"diagnostics",
			symbols = { error = " ", warn = " ", info = " ", hint = " " },
		},
		{
			"filetype",
			icon_only = true,
			separator = "",
			padding = { left = 1, right = 0 },
		},
	},
	lualine_x = {
		{
			lazy_status.updates,
			cond = lazy_status.has_updates,
			padding = { left = 1, right = 1 },
		},
		{
			"diff",
			symbols = { added = " ", modified = " ", removed = " " },
		},
		{ "encoding" },
		{ "fileformat" },
		{ "filetype" },
	},
	lualine_y = {
		{ "progress", padding = { left = 1, right = 1 } },
		{ "location", icon = " ", padding = { left = 1, right = 1 } },
	},
	lualine_z = {
		{
			function()
				return " " .. os.date("%R")
			end,
			padding = { left = 1, right = 1 },
		},
	},
}

M.winbar = {
	lualine_b = {
		{
			"filename",
			path = 1,
			symbols = { modified = " ", readonly = " ", unnamed = "[No Name]" },
			padding = { left = 1, right = 1 },
		},
	},
}

M.inactive_winbar = {
	lualine_b = {
		{
			"filename",
			path = 1,
			padding = { left = 1, right = 1 },
		},
	},
}

return M
