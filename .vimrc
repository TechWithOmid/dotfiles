set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" The bundles you install will be listed here
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'scrooloose/nerdtree'
" Bundle 'klen/python-mode'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Bundle 'djoshea/vim-autoread'
" Bundle 'janko-m/vim-test'  - useless with bazel
Bundle 'kien/ctrlp.vim'
Bundle 'mitsuhiko/vim-jinja'
Bundle 'saltstack/salt-vim'
Bundle 'tpope/vim-surround'
Bundle 'mantiz/vim-plugin-dirsettings'
Bundle 'junegunn/goyo.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'pearofducks/ansible-vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'Yggdroot/indentLine'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'jmcomets/vim-pony'

filetype plugin indent on
syntax on
" packadd! dracula
syntax enable
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    " autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    " autocmd FileType python match Excess /\%150v.*/
    autocmd FileType python set nowrap
    autocmd FileType python set colorcolumn=120
    augroup END

" ansible-vim for YAML+Jinja highlight
au BufRead,BufNewFile *.mwyml set filetype=yaml.ansible

" Powerline setup
set encoding=utf-8
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2
set fillchars+=stl:\ ,stlnc:\
let g:Powerline_symbols = 'fancy'

" indet line setup
let g:indentLine_char_list = ['┊']
set foldmethod=manual


" NerdTree setup
" close NERDTree after closing files
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") 
      \ && b:NERDTree.isTabTree()) | q | endif

command NERDTreeFindAndFocus call NERDTreeFind() | call NERDTreeFocus()
map <silent> <C-n> :NERDTreeFindAndFocus<CR>
let NERDTreeIgnore = ['\.pyc$']

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path = 'python'  " Py3 support

" syntastic
let python_highlight_all=1

" utlisnipt setup
let g:UltiSnipsExpandTrigger="<c-j>"

" vim.test
" let test#python#runner = 'pytest'

" Goyo
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set background=dark
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" ack/ag
let g:ackprg = 'ag --vimgrep --smart-case --ignore node_modules --ignore build'

cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" CtrlP
" Remove limits on the number of files:
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=100

" General settings
set smartindent
set expandtab
set ignorecase
set smartcase
set shiftwidth=4
set tabstop=4
set hlsearch
set ruler
" set mouse=a - uncomment this part if you want to use you mouse
set autowrite
set autoread
set nofoldenable
set number
" Maintain undo history between sessions in ~/.vim/undodir:
set undofile
set undodir=~/.vim/undodir
" More natural split opening
set splitbelow
set splitright
" Search faster
set wildignore=*.dll,*.exe,*.pyc,*.pdf,*.doc,*.gz
set wildignore+=**/node_modules/** 
" Force UNIX line endings
set ff=unix

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif

" Shortcuts
let mapleader = ","
command Deploy !rsync -av ~/granthub-service/. ipmc-dev11:granthub-service
command Bash !bash
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>d :YcmCompleter GetDoc<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>wq :wq<CR>

" flake8 shortcut
autocmd FileType python map <leader> :call flake8#Flake8()<CR>

" AsuncRun setup
nnoremap <leader>r :AsyncRun -raw python % <CR>
:let g:asyncrun_open = 12
nnoremap <leader>c :bw!<CR>

" tab navigations
nnoremap td :tabclose<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap nt :tabnew<CR>

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Use Return as Escape in insert mode
" inoremap <CR> <Esc>
" Use K to split string under cursor
nnoremap K i<CR><Esc>l

" Remove trailing whitespace in Python files
autocmd BufWritePre *.py %s/\s\+$//e

" Settings for working with YAML
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
