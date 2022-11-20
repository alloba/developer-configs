-- Always install these extensions.
vim.g.coc_global_extensions = { 'coc-prettier', 'coc-sumneko-lua', 'coc-python', 'coc-json' }

-- Shortcuts 
--
vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>CocCommand<cr>', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-l>', '<cmd>call CocAction("format")<cr>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<cmd>call CocAction("format")<cr>', { noremap = true })

vim.api.nvim_set_keymap(
    'i', '<Tab>',
    'coc#pum#visible() ? coc#pum#next(1) : "<Tab>"',
    { noremap = true, expr = true }
)
vim.api.nvim_set_keymap(
    'i', '<S-Tab>',
    'coc#pum#visible() ? coc#pum#prev(1) : "<S-Tab>"',
    { noremap = true, expr = true }
)

vim.api.nvim_set_keymap(
    'i', '<C-j>',
    'coc#pum#visible()? coc#pum#next(1): coc#refresh()',
    { noremap = true, silent = true, expr = true }
)
vim.api.nvim_set_keymap(
    'i', '<C-k>',
    'coc#pum#visible()? coc#pum#prev(1): "<C-k>"',
    { noremap = true, silent = true, expr = true }
)

vim.api.nvim_set_keymap(
    'i', '<CR>',
    'coc#pum#visible() ? coc#pum#confirm(): "<C-g>u<CR><c-r>=coc#on_enter()<CR>"',
    { noremap = true, expr = true, silent = true }
)

