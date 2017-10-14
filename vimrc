" Plugins
call plug#begin()
Plug 'Valloric/YouCompleteMe'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'mattn/emmet-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'edkolev/tmuxline.vim'
call plug#end()

" Colors
syntax enable
"set termguicolors
let g:gruvbox_italic=1
silent! colorscheme gruvbox
set background=dark

" Spaces & Tabs
set tabstop=2 shiftwidth=2 expandtab " tabs to 2 spaces
set autoindent                       " autoindent
set textwidth=79                     " wrap text

" UI Config
set number
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
" First tab will complete to longest string and show the the match list, then
" second tab will complete to first full match and open the wildmenu
set wildmode=longest:list,full
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set laststatus=2        " always show airline
set ruler               " shows row and column number at bottom right corner

" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" Folding
" TODO: maybe?

" Leader Shortcuts
let mapleader=" "

" Autogroups
augroup configgroup
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e " remove trailing space
augroup END

" MISC
set nocompatible
filetype plugin indent on  " load filetype-specific indent and plugin files on
set clipboard=unnamed      " enable system clipboard for OSX

" open split panes right and bottom
set splitbelow
set splitright

" remap tab for autocompletion
inoremap <Tab> <C-N>

"remap split pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"YouCompleteMe settings
let g:ycm_python_binary_path = 'python3'


" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" annoying
set noswapfile
" put swap, backup and undo files in this location instead of the working directory
" double trailing slashes tells vim to avoid name collisions
" set backupdir=~/.vim/backup//
" set directory=~/.vim/swap//
" set undodir=~/.vim/undo//

" airline
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols = {}
let g:airline_symbols.branch = '⎇'

function! JSFormat()
    execute "! prettier --single-quote --write " . bufname("%")
    execute "! ./node_modules/.bin/eslint --fix " . bufname("%")
endfunction

nnoremap <buffer> <leader>jf :call JSFormat()<cr>

