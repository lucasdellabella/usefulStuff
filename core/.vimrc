filetype plugin indent on
syntax enable
set encoding=utf-8

call plug#begin('~/.vim/plugged')

"Plugin 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-classpath'
Plug 'leafgarland/typescript-vim'
Plug 'tomlion/vim-solidity'
" NOT SURE HOW TO USE YET
"   Plugin 'easymotion/vim-easymotion'
" IS HONESTLY ANNOYING
"   Plugin 'ntpeters/vim-better-whitespace'
" I LITERALLY HAVE NEVER USED THIS
"   Plugin 'scrooloose/syntastic'
"   Plugin 'dhruvasagar/vim-table-mode'
"   Plugin 'Xolox/vim-notes'
"   Plugin 'xolox/vim-misc'
"   Plugin 'bling/vim-airline'
" dAnK sOfTwArE BRo
"   Plugin 'Valloric/YouCompleteMe'

call plug#end()

" Mappings
inoremap jk <ESC>
let mapleader = "\<Space>"
:imap <D-v> ^O:set paste<Enter>^R+^O:set nopaste<Enter>

" Text settings
set nowrap
set shiftwidth=2
set tabstop=2
set backspace=indent,eol,start
set number
set autoindent
set copyindent
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set expandtab
set hlsearch
set incsearch

" Get rid of backup files
set nobackup
set noswapfile

" Syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

"let g:syntastic_javascript_checkers = ['eslint']

" Syntastic Debugging
" let g:syntastic_debug = 3

" zenburn vim settings
set t_Co=256
set background=dark
color zenburn

" NERDTree settings
map <C-n> :NERDTreeToggle<CR> " Map ctrl-n to NERDTree
let NERDTreeIgnore = ['\.meta$']

" Autopairs settings
"let g:AutoPairsFlyMode = 1

" Vim-tmux-navigator settings
"let g:tmux_navigator_no_mappings = 1
"nnoremap <silent> {c-h} :TmuxNavigateLeft<cr>
"nnoremap <silent> {c-j} :TmuxNavigateDown<cr>
"nnoremap <silent> {c-k} :TmuxNavigateUp<cr>
"nnoremap <silent> {c-l} :TmuxNavigateRight<cr>
"nnoremap <silent> {c-\\} :TmuxNavigatePrevious<cr>
set term=screen-256color

" Vim window settings
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
set splitbelow
set splitright
