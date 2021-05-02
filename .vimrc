" indentation options
set autoindent              "newlines inherit indentation
set expandtab               "tabs to spaces
""set filetype indent on    "file-type specific indentation rules
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
syntax enable               "syntax highlighting (does this not happen by default?)
set wrap                    "enable word wrap

" UI options
set ruler                   "always show cursor position
set wildmenu                "display command line's tab complete options as a menu
""set colorscheme wombat256mod
""set cursorline            "highlight line under cursor
set number                  "show line numbers
set noerrorbells            "turn off system beep. pls. T_T
""set visualbells           "flash screen instead of beeping
set mouse=a                 "enable mouse for scrolling and resizing
set title                   "change window title to current file
set background=dark         "use colors suitable for dark background

" code folding options
set foldmethod=indent
""set foldnestmax=3

" misc options
set history=500
""set spell                 "spell checking


" Vim Plugins (vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
call plug#end()
nnoremap <leader>n :NERDTreeToggle<CR>

" Theme
autocmd vimenter * ++nested colorscheme gruvbox
"colorscheme gruvbox
