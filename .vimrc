" Vim plug settings
call plug#begin('~/.vim/plugged')

" Visual Plugins
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'jceb/vim-orgmode'

" Workflow Plugins
Plug 'scrooloose/nerdTree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/goyo.vim'

" Code Plugins
Plug 'jiangmiao/auto-pairs'
Plug 'Valloric/YouCompleteMe'
Plug 'epeli/slimux'
Plug 'KabbAmine/zeavim.vim'

call plug#end()
filetype plugin indent on

" Custom
let mapleader = " "
:inoremap jk <Esc>

" NerdTree settings
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Slimux Shortcuts
map <Leader>s :SlimuxREPLSendLine<CR>
map <Leader>r :SlimuxREPLConfigure<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>
map <Leader>a :SlimuxShellLast<CR>
map <Leader>k :SlimuxSendKeysLast<CR>

" Generic settings
syntax enable
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set background=dark
set cc=81

" Enable mouse
set mouse=a

" 256 bit color settings
set t_Co=256
colors zenburn

" Merlin (OCaml) Settings
let g:opamshare = substitute(system('opam config var share'), '\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
let g:syntastic_ocaml_checkers = ['merlin']

" Indent line settings
let g:indentLine_color_term = 230
let g:indentLine_char = '¦'

" Prevent Goyo from changing background to light on exit
autocmd! User GoyoLeave
autocmd User GoyoLeave nested set background=dark

" vim-airline settings
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
