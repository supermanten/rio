-- File: lua/core/telescope/init.lua

local config = require("core.telescope.config")
local extensions = require("core.telescope.extensions")
local mappings = require("core.telescope.mappings")

local M = {}

function M.setup()
	local telescope = require("telescope")

	-- Set up the main configuration
	telescope.setup({
		sort_mru = config.sort_mru,
		sort_lastused = config.sort_lastused,
		ignore_current_buffer = config.ignore_current_buffer,
		pickers = config.pickers,
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown({}),
			},
		},
		defaults = vim.tbl_deep_extend("force", config.defaults, { mappings = mappings }),
	})

	-- Load extensions
	extensions.setup(telescope)
end

return M
