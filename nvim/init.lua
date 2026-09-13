-- Set leader keys before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Core configuration
require("config.options")
require("config.keymaps")
require("config.lazy")
