call plug#begin()
    " Pywal integration
    Plug 'dylanaraps/wal.vim'

    " Tree expolrer
    Plug 'preservim/nerdtree'
    
    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

call plug#end()


"""" Basic Behavior
set number              " show line numbers
set nowrap              " don't wrap lines
set encoding=utf-8      " set encoding to UTF-8 
set mouse=a             " enable mouse support 
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw screen only when we need to
set showmatch           " highlight matching parentheses / brackets [{()}]
set laststatus=2        " always show statusline 
set ruler               " show line and column number of the cursor on right side of statusline
set visualbell          " blink cursor on error, instead of beeping
set autoread           " autoreload the file in Vim if it has been changed outside of Vim
syntax enable
filetype plugin indent on
" set cursorline         " highlight current line


"""" Key Bindings
let mapleader = " "
nmap j gj
nmap k gk
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <CR> :nohlsearch<CR><CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Tab> :tabn<CR>
nnoremap <S-Tab> :tabp<CR>

"""" Vim Appearance
colorscheme wal


"""" Tab settings
set tabstop=4           " width that a <TAB> character displays as
set expandtab           " convert <TAB> key-presses to spaces
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " backspace after pressing <TAB> will remove up to this many spaces
set autoindent          " copy indent from current line when starting a new line
set smartindent         " even better autoindent (e.g. add indent after '{')


"""" Search settings
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

"""" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
