if has('win32') || has('win64')
    let g:plugged_home = '~/AppData/Local/nvim/plugged'
else
    let g:plugged_home = '~/.vim/plugged'
endif
" Plugins List
call plug#begin(g:plugged_home)
" UI related
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
" Better Visual Guide
Plug 'Yggdroot/indentLine'
" syntax check
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs' " quote and bracket completion

" finder and nerdtree
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'mattn/emmet-vim' "emmet 
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-jedi'
" Formater
Plug 'Chiel92/vim-autoformat'
Plug 'davidhalter/jedi-vim' " goto definition
Plug 'terryma/vim-multiple-cursors' " mutliple cursor
call plug#end()
filetype plugin indent on

" Configurations Part
" UI configuration
syntax on
syntax enable
set termbidi
set number
set relativenumber
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw
set clipboard=unnamedplus

" Turn off backup
set nobackup
set noswapfile
set nowritebackup
" Search configuration
set ignorecase                    " ignore case when searching
set smartcase                     " turn on smartcase
" Tab and Indent configuration
set expandtab
set tabstop=4
set shiftwidth=4

" colorscheme
colorscheme gruvbox
" True Color Support if it's avaiable in terminal
if has("termguicolors")
    set termguicolors
endif
if has("gui_running")
  set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
 endif
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg 

" make number line darker
hi LineNr       term=bold cterm=bold ctermfg=2 guifg=Grey guibg=Grey20

" shortcuts
inoremap <C-c> <Esc>
noremap Y "*y
let mapleader = ","

" vim-autoformat
noremap <F3> :Autoformat<CR>
" deoplete autocomplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" toggle colorscheme shortcut
nnoremap <Leader>o :call Toggle_Colorscheme()<CR>

" NCM2
" augroup NCM2
"     autocmd!
"     " enable ncm2 for all buffers
"     autocmd BufEnter * call ncm2#enable_for_buffer()
"     " :help Ncm2PopupOpen for more information
"     set completeopt=noinsert,menuone,noselect
"     " When the <Enter> key is pressed while the popup menu is visible, it only
"     " hides the menu. Use this mapping to close the menu and also start a new line.
"     inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
"     " uncomment this block if you use vimtex for LaTex
"     " autocmd Filetype tex call ncm2#register_source({
"     "           \ 'name': 'vimtex',
"     "           \ 'priority': 8,
"     "           \ 'scope': ['tex'],
"     "           \ 'mark': 'tex',
"     "           \ 'word_pattern': '\w+',
"     "           \ 'complete_pattern': g:vimtex#re#ncm2,
"     "           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"     "           \ })
" augroup END
" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}
" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
let g:airline_theme='powerlineish' " airline theme

" NerdTree setup
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") 
      \ && b:NERDTree.isTabTree()) | q | endif

command NERDTreeFindAndFocus call NERDTreeFind() | call NERDTreeFocus()
nnoremap <leader>t :NERDTreeFindAndFocus<CR>
let NERDTreeIgnore = ['\.pyc$']
nnoremap <leader>t :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

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

" html autoclose tag
autocmd FileType xml,html inoremap </ </<C-x><C-o>
" emmet config
let g:user_emmet_leader_key=',' " redefine trigger key

" fuzzy config
let g:fzf_layout = { 'down': '30%' }
nnoremap <C-p> :Files<Cr>

" add function for toggle between light and dark theme
function! Toggle_Colorscheme()
    if &background ==  'dark'
        set background=light
        hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg 
    else
        set background=dark
        hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg 
    endif
endfunction
