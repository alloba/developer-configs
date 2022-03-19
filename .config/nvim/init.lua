-- Setup Instructions: 
-- - Install Packer. GitHub has fine instructions. 

-- Files underneath the lua folder, executed directly. 
require('plugins')
require('settings')

-- LSP Zero is all about language server stuff. 
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.nvim_workspace()
lsp.setup()









