" Plugins
call plug#begin()
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 ./install.py --ts-completer --go-completer' }
Plug 'godlygeek/tabular'
" Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Syntax
Plug 'elixir-editors/vim-elixir',  { 'for': 'elixir' }
Plug 'lifepillar/pgsql.vim',       { 'for': 'sql' }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.jsx'] }
Plug 'pangloss/vim-javascript',    { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx',                { 'for': ['javascript.jsx', 'typescript.jsx'] }
Plug 'kopischke/vim-fetch'
call plug#end()

" MISC
set nocompatible
filetype plugin indent on  " load filetype-specific indent and plugin files on
set clipboard=unnamed      " enable system clipboard for OSX

" open split panes right and bottom
set splitbelow
set splitright

"remap split pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-t> :Files<CR>

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
endif

" annoying
set noswapfile
" put swap, backup and undo files in this location instead of the working directory
" double trailing slashes tells vim to avoid name collisions
" set backupdir=~/.vim/backup//
" set directory=~/.vim/swap//
" set undodir=~/.vim/undo//

"file encoding
set encoding=utf-8     " The encoding displayed.
set fileencoding=utf-8 " The encoding written to file.

" Spaces & Tabs
set tabstop=2 shiftwidth=2 expandtab " tabs to 2 spaces
set autoindent                       " autoindent
set textwidth=79                     " wrap text

" Leader Shortcuts
let mapleader=" "

" First tab will complete to longest string and show the the match list, then
" second tab will complete to first full match and open the wildmenu
set wildmode=longest:list,full

" Searching
" uppercase search string => case sensitive search
" lowercase search string => case insensitive search.
set ignorecase
set smartcase
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" https://github.com/leafgarland/typescript-vim/pull/140/files
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.jsx
autocmd BufNewFile,BufRead *.gs  set syntax=javascript


" UI
" Colors
if exists('$TMUX')
  set termguicolors
endif
syntax enable
set background=dark
"let g:gruvbox_italic=1
silent! colorscheme gruvbox

set number
set showcmd             " show command in bottom bar
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set ruler               " shows row and column number at bottom right corner

" Always show file
set laststatus=2
set statusline+=%F

" YCM
let g:ycm_language_server = [
  \   {
  \     'name': 'ruby',
  \     'cmdline': [ expand( '$HOME/.rbenv/shims/solargraph' ), 'stdio' ],
  \     'filetypes': [ 'ruby' ],
  \   },
  \ ]
