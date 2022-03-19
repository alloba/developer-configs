-- basic settings
vim.o.encoding = "utf-8"
vim.o.backspace = "indent,eol,start" -- backspace works on every char in insert mode


-- Display
vim.o.showmatch  = true -- show matching brackets
vim.o.scrolloff = 3 -- always show 3 rows from edge of the screen
vim.o.synmaxcol = 300 -- stop syntax highlight after x lines for performance
vim.o.laststatus = 2 -- always show status line

vim.o.list = false -- do not display white characters
vim.o.foldenable = false
vim.o.foldlevel = 4 -- limit folding to 4 levels
vim.o.foldmethod = 'syntax' -- use language syntax to generate folds
vim.o.wrap = false --do not wrap lines even if very long
vim.o.eol = false -- show if there's no eol char
vim.o.showbreak= '↪' -- character to show when line is broken


-- Sidebar
vim.o.number = true -- line number on the left
--vim.o.numberwidth = 3 -- always reserve 3 spaces for line number
--vim.o.signcolumn = 'yes' -- keep 1 column for coc.vim  check
--vim.o.modelines = 0
vim.o.showcmd = true -- display command in bottom bar


-- Search
vim.o.incsearch = true -- starts searching as soon as typing, without enter needed
vim.o.ignorecase = true -- ignore letter case when searching
vim.o.smartcase = true -- case insentive unless capitals used in search


-- White characters
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 4 -- 1 tab = 2 spaces
vim.o.shiftwidth = 4 -- indentation rule
vim.o.formatoptions = 'qnj1' -- q  - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word
vim.o.expandtab = true -- expand tab to spaces


-- Theme
vim.o.background = 'dark'
vim.opt.termguicolors = true
vim.cmd([[colorscheme tokyonight]])


-- Key Bindings
vim.api.nvim_set_keymap( 'n', '<S-Down>', ':m+<CR>',            { noremap = true }) -- nnoremap <S-Down> :m+<CR>
vim.api.nvim_set_keymap( 'n', '<S-Up>'  , ':m-2<CR>',           { noremap = true }) -- nnoremap <S-Up>   :m-2<CR>
vim.api.nvim_set_keymap( 'i', '<S-Up>'  , '<Esc>:m-2<CR>',      { noremap = true }) -- inoremap <S-Up>   <Esc>:m-2<CR>
vim.api.nvim_set_keymap( 'i', '<S-Down>', '<Esc>:m+<CR>',       { noremap = true }) -- inoremap <S-Down> <Esc>:m+<CR>

vim.api.nvim_set_keymap( 'n', '<C-n>'   , ':NvimTreeToggle<CR>',{ noremap = true  }) -- nnoremap <C-n>    :NvimTreeToggle<CR>
vim.api.nvim_set_keymap( 'n', '<F1>'    , ':FloatermNew<CR>',   { noremap = true  }) -- nnoremap <C-;>    :FloatermNew<CR>
vim.api.nvim_set_keymap( 't', '<F1>'    , '<C-d><CR>',          { noremap = true  }) -- nnoremap <C-d>    <CR>
