return {
	"saghen/blink.cmp",
	lazy = false,
	version = "v0.*",
	dependencies = {
		{ "saghen/blink.compat", opts = { enable_events = true } },
		{
			"Exafunction/codeium.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
			opts = {},
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load({
					paths = vim.fn.stdpath("config") .. "/snippets",
				})
			end,
		},
	},
	config = function()
		require("core.blink").setup()
	end,
}
