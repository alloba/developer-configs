local has, treesitter = pcall(require, 'nvim-treesitter.configs')
if has then
    treesitter.setup({
        auto_install = true,
        highlight = {
            enable = true
        },
        disable = {
        }
    })

    -- This overrides the foldmethod found in settings.lua.
    --    vim.opt.foldmethod = 'expr'
    --    vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

    --  beyond that even, there is a workaround described for users of packer:
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
        group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
        callback = function()
            vim.opt.foldmethod = 'expr'
            vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
        end
    })
end
