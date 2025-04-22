vim.g.mapleader = " " 
vim.g.maplocalleader = "\\" 

require("core-config")
require("keymaps")

-- call lazy last to ensure leader key config is set. 
require('config.lazy')
