vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>CocCommand<cr>',
    { noremap = true })

-- Tab and shift-tab to move around the auto-suggestion popup
vim.api.nvim_set_keymap('i', '<Tab>', 'coc#pum#visible() ? coc#pum#next(1) : "<Tab>"'
    , { noremap = true, expr = true })

vim.api.nvim_set_keymap('i', '<S-Tab>', 'coc#pum#visible() ? coc#pum#prev(1) : "<S-Tab>"',
    { noremap = true, expr = true })


-- Enter to confirm suggestion in popup
-- <C-g>u fucks undo a bit, but I've decided to not care. 
vim.api.nvim_set_keymap('i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"',
    { noremap = true, expr = true, silent = true })

vim.g.coc_global_extensions = {'coc-prettier', 'coc-sumneko-lua', 'coc-python', 'coc-json'}
--{'coc-prettier', 'coc-sumneko-lua', 'coc-html', 'coc-tsserver', 'coc-python', 'coc-json', 'coc-go'}
