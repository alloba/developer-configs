-- if you're in this file you're going to also want to be referring to the readme for coc 
-- https://github.com/neoclide/coc.nvim#readme

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

-- Use K to show documentation in preview window.
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
vim.api.nvim_set_keymap("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

