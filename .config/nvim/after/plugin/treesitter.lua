require 'nvim-treesitter.configs'.setup {
    auto_install = true,
    highlight = {
        enable = true
    },
    disable = {
    }
}

-- This overrides the foldmethod found in settings.lua.
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
