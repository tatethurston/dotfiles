" ----------------vim-plug------------------------------------
call plug#begin()

Plug 'ctrlpvim/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-abolish'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'blueshirts/darcula'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'

call plug#end()
" -----------------------------------------------------------

set nocompatible
filetype plugin indent on

" colorscheme
syntax enable
silent! colorscheme gruvbox
set background=dark

" always show airline
set laststatus=2

" show line numbers
set number

" shows row and column number at bottom right corner
set ruler

" tabs to 2 spaces
set tabstop=2 shiftwidth=2 expandtab

" autoindent
set autoindent

" highlight current line
set cursorline

" open split panes right and bottom
set splitbelow
set splitright

" highlight searches and perform incremental search
set hlsearch
set incsearch

" remap tab for autocompletion
inoremap <Tab> <C-N>

"remap split pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" enable system clipboard for OSX
set clipboard=unnamed

" First tab will complete to longest string and show the the match list, then
" second tab will complete to first full match and open the wildmenu
set wildmenu
set wildmode=longest:list,full

" Use ag for CtrlP
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

