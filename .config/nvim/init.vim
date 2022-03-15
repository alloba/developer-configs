" indentation options
set autoindent              "newlines inherit indentation
set expandtab               "tabs to spaces
filetype plugin indent on   "file-type specific indentation rules
set shiftround              "shifting lines rounds to nearest increment of shiftwidth
set shiftwidth=4
set smarttab                "insert tabstop spaces when tab key pressed
set tabstop=4               "indend with 4 spaces

" search options
set hlsearch                "search highlighting
set ignorecase
set incsearch               "incremental search (partial matches)
set smartcase               "search is case sensitive if there is a capital letter in the string

" text rendering options
set display+=lastline       "try to always show a paragraph's last line
set encoding=utf-8
set linebreak               "avoid wrapping a line mid-word
set scrolloff=1             "number of lines to keep above and below cursor on screen
set sidescrolloff=5
syntax on                   "syntax highlighting (does this not happen by default?)
set wrap                    "enable word wrap

" UI options
set ruler                   "always show cursor position
set wildmenu                "display command line's tab complete options as a menu
""set cursorline            "highlight line under cursor
set number                  "show line numbers
set noerrorbells            "turn off system beep. pls. T_T
""set visualbells           "flash screen instead of beeping
set mouse=a                 "enable mouse for scrolling and resizing
set mouse=v                 "enable middle click to paste
set title                   "change window title to current file
set background=dark         "use colors suitable for dark background
set clipboard=unnamedplus   "use system clipboard. no promises with wsl.
set ttyfast                 "faster scrolling


"" Standard Key Mapping
"""Shift + Up/Down to move current line up/down
nnoremap <S-Down> :m+<CR>            
nnoremap <S-Up> :m-2<CR>             
inoremap <S-Down> <Esc>:m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>

"""The terminal emulator is cool, but how dare they not maintain Esc behavior
tnoremap <esc> <C-\><C-N>

"" Vim Plug configuration / plugins list. 
call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'folke/tokyonight.nvim', { 'branch':'main' }
Plug 'hashivim/vim-terraform'
call plug#end()

""" Plugin key mapping
"""" NerdTree
nnoremap <leader>n :NERDTreeToggle<CR>


"" Theme Settings
colorscheme tokyonight
