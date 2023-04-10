--print('Load keybinds.lua')

--vim.api.nvim_set_keymap('n', ' ', '<Leader>', {noremap = true}) --this may not be needed? delete if no problems in the future (@2023-04-10)
vim.g.mapleader = ' '



-- Move current lines up/down
-- -- Allow moving the current line up and down in the file, in specified modes (n=normal, i=insert,v=visual)
vim.api.nvim_set_keymap( 'n', '<S-Up>'  , ':m -2<CR>==',           { noremap = true }) -- nnoremap <S-Up>   :m-2<CR>
vim.api.nvim_set_keymap( 'n', '<S-Down>', ':m +<CR>==',            { noremap = true }) -- nnoremap <S-Down> :m+<CR>
vim.api.nvim_set_keymap( 'i', '<S-Up>'  , '<Esc>:m -2<CR>==gi',      { noremap = true }) -- inoremap <S-Up>   <Esc>:m-2<CR>
vim.api.nvim_set_keymap( 'i', '<S-Down>', '<Esc>:m +<CR>==gi',       { noremap = true }) -- inoremap <S-Down> <Esc>:m+<CR>
vim.api.nvim_set_keymap( 'v', '<S-Up>'  , ":m '<-2<CR>gv=gv",       { noremap = true }) 
vim.api.nvim_set_keymap( 'v', '<S-Down>', ":m '>+1<CR>gv=gv",      { noremap = true }) 

