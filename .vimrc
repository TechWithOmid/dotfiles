call plug#begin()
    " Pywal integration
    Plug 'dylanaraps/wal.vim'

    " Markdown preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}


    " Tree expolrer
    Plug 'preservim/nerdtree'
    
    " Goyo (zen mode)
    " enable with :Goyo disable by :Goyo!
    Plug 'junegunn/goyo.vim'
    
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
set formatoptions-=cro
" set cursorline         " highlight current line


syntax enable
filetype plugin indent on


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
nmap <leader>f :Goyo<CR>
nmap <leader>m :MarkdownPreview<CR>
" nmap <leader>f :Goyo!<CR>

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
set is             " highlight on search
set hls            " highlight matches

"""" Goyo settings
" basicly hide the tmux status bar when in goyo mode
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    " silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z "
    " this will full screen the pan
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    " silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
  