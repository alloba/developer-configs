local has, lspconfig = pcall(require, 'lspconfig')
if has then
    vim.keymap.set('n', '<C-l>', vim.lsp.buf.format, {})
    vim.keymap.set('i', '<C-l>', vim.lsp.buf.format, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

    local has_telebuiltin, builtin = pcall(require, 'telescope.builtin')
    if has_telebuiltin then
        vim.keymap.set('n', 'gr', builtin.lsp_references, {})
        vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
        vim.keymap.set('n', 'gi', builtin.lsp_implementations, {})
    else
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
    end


    vim.api.nvim_create_user_command(
        'Rename',
        function(opts)
            vim.lsp.buf.rename()
        end,
        { nargs = 0 }
    )
end
