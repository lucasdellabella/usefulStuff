set encoding=utf-8
syntax on
filetype plugin indent on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'scrooloose/nerdtree'
Plugin 'jelera/vim-javascript-syntax'
" Plugin 'mxw/vim-jsx'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'othree/yajs.vim'
Plugin 'mru.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'lervag/vimtex'
Plugin 'easymotion/vim-easymotion'
Plugin 'edkolev/tmuxline.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ajh17/vimcompletesme'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'dmdque/solidity.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'prettier/vim-prettier'
Plugin 'rking/ag.vim'
Plugin 'tmhedberg/simpylfold'
Plugin 'chriskempson/base16-vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'styled-components/vim-styled-components'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'ap/vim-css-color'
Plugin 'mileszs/ack.vim'
Plugin 'tommcdo/vim-fubitive'

call vundle#end()

set t_Co=256
color zenburn

" Mappings
inoremap jk <ESC>
let mapleader = "\<Space>"
:imap <D-v> ^O:set paste<Enter>^R+^O:set nopaste<Enter>

" Text settings
set nowrap
set shiftwidth=4
set tabstop=4
set backspace=indent,eol,start
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
set wrap
set linebreak
set nolist
set laststatus=2
set autoread
set number
set mouse=a
au CursorHold * checktime
autocmd BufWritePre * StripWhitespace

:set regexpengine=1
:syntax enable

" Get rid of backup files
set nobackup
set noswapfile

" Airline settings
let g:airline_powerline_fonts = 1
let g:tmuxline_powerline_separators = 1

let g:lightline = {
  \   'colorscheme': 'seoul256',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified']
  \     ],
  \     'right':[ ['lineinfo'],
  \               ['percent'],
  \               ['fileformat', 'fileencoding', 'filetype'] ]
  \   },
    \   'component': {
    \     'lineinfo': ' %3l:%-2v',
    \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }

let g:lightline.subseparator = {
    \   'left': '', 'right': ''
\}

set guioptions-=e  " Don't use GUI tabline

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'y'    : '#(date)',
      \'z'    : '#(whoami)'}

" highlighting
let g:vim_jsx_pretty_colorful_config = 1 " default 0


" NERDTree settings
map <C-n> :NERDTreeToggle<CR> " Map ctrl-n to NERDTree
let g:NERDTreeHijackNetrw=0
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('ini', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('md', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'gray', 'none', 'gray', '#151515')
call NERDTreeHighlightFile('html', 'gray', 'none', 'gray', '#151515')
call NERDTreeHighlightFile('py', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'Magenta', 'none', 'ff00ff', '#151515')

" ctrlp settings
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Vim window settings
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
set splitbelow
set splitright

" No more :set paste/:set nopaste!
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" Tmux-like window resizing
function! IsEdgeWindowSelected(direction)
  let l:curwindow = winnr()
  exec "wincmd ".a:direction
  let l:result = l:curwindow == winnr()
  if (!l:result)
    " Go back to the previous window
    exec l:curwindow."wincmd w"
  endif
  return l:result
endfunction

function! GetAction(direction)
    let l:keys = ['h', 'j', 'k', 'l']
    let l:actions = ['vertical resize -', 'resize +', 'resize -', 'vertical resize +']
    return get(l:actions, index(l:keys, a:direction))
endfunction

function! GetOpposite(direction)
    let l:keys = ['h', 'j', 'k', 'l']
    let l:opposites = ['l', 'k', 'j', 'h']
    return get(l:opposites, index(l:keys, a:direction))
endfunction

function! TmuxResize(direction, amount)
    " v >
    if (a:direction == 'j' || a:direction == 'l')
        if IsEdgeWindowSelected(a:direction)
            let l:opposite = GetOpposite(a:direction)
            let l:curwindow = winnr()
            exec 'wincmd '.l:opposite
            let l:action = GetAction(a:direction)
            exec l:action.a:amount
            exec l:curwindow.'wincmd w'
            return
        endif
    " < ^
    elseif (a:direction == 'h' || a:direction == 'k')
        let l:opposite = GetOpposite(a:direction)
        if IsEdgeWindowSelected(l:opposite)
            let l:curwindow = winnr()
            exec 'wincmd '.a:direction
            let l:action = GetAction(a:direction)
            exec l:action.a:amount
            exec l:curwindow.'wincmd w'
            return
        endif
    endif

    let l:action = GetAction(a:direction)
    exec l:action.a:amount
endfunction

" folding properties
let g:SimpylFold_docstring_preview = 0
set foldlevelstart=1

" resize vim splits
nnoremap <C-W>h :call TmuxResize('h', 10)<CR>
nnoremap <C-W>j :call TmuxResize('j', 10)<CR>
nnoremap <C-W>k :call TmuxResize('k', 10)<CR>
nnoremap <C-W>l :call TmuxResize('l', 10)<CR>

" Ag settings
nmap <C-s> :Ag "def <cword>" . <CR>
colors zenburn

" Mustache settings
au BufReadPost *.hbs set syntax=mustache
au BufReadPost Dockerfile* set syntax=dockerfile

