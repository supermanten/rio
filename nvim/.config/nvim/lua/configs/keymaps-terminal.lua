local util = require("utils.keymaps")
local basic_map = util.basic_map

-- Toggle Terminal (Normal mode)
basic_map("n", "<leader>t", "<cmd>ToggleTerm<cr>", "Toggle Terminal")

-- Exit ToggleTerm (Terminal mode)
basic_map("t", "<esc><esc>", "<cmd>ToggleTerm<cr>", "Exit ToggleTerm")

-- Open Telescope search for todo comments
basic_map("n", "<leader>I", "<Cmd>TodoTelescope<CR>", "Todo Telescope")

-- ## Flutter Tools
-- Grouped under leader + F
basic_map("n", "<leader>Ff", "<cmd>FlutterRun<CR>", "Flutter Run")
basic_map("n", "<leader>Fq", "<cmd>FlutterQuit<CR>", "Flutter Quit")
basic_map("n", "<leader>Fr", "<cmd>FlutterReload<CR>", "Flutter Hot Reload")
basic_map("n", "<leader>FR", "<cmd>FlutterRestart<CR>", "Flutter Hot Restart")
basic_map("n", "<leader>Fd", "<cmd>FlutterDevices<CR>", "Flutter Devices")
