vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>CocCommand<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<cmd>call CocAction("format")<cr>',    { noremap = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<cmd>call CocAction("format")<cr>',    { noremap = true })

-- Tab and shift-tab to move around the auto-suggestion popup
vim.api.nvim_set_keymap('i', '<Tab>', 'coc#pum#visible() ? coc#pum#next(1) : "<Tab>"'
    , { noremap = true, expr = true })

vim.api.nvim_set_keymap('i', '<S-Tab>', 'coc#pum#visible() ? coc#pum#prev(1) : "<S-Tab>"',
    { noremap = true, expr = true })


-- my never ending attempts to get the enter key to select suggestions.
-- i've now given up entirely and fallen back to vimscript
vim.cmd [[
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
                              ]]

-- Always install these extensions.
vim.g.coc_global_extensions = { 'coc-prettier', 'coc-sumneko-lua', 'coc-python', 'coc-json' }
