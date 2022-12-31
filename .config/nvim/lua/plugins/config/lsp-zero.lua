local lsp = require('lsp-zero')
local cmp = require('cmp')

lsp.preset('recommended')

local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-e>'] = cmp.mapping.abort(),
})

cmp.setup {
    sources = {
        { name = 'nvim_lua' }
    }
}

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.setup()


-- Shortcuts
vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, { remap = false })
vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, { remap = false })
vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, { remap = false })
vim.keymap.set('n', '<C-h>', function() vim.diagnostic.open_float() end, { remap = false })

vim.keymap.set('n', '<C-l>', function() vim.lsp.buf.format() end, { remap = false })
vim.keymap.set('i', '<C-l>', function() vim.lsp.buf.format() end, { remap = false })
