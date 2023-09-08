" Plugins
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" https://raw.githubusercontent.com/godlygeek/tabular/master/doc/Tabular.txt 
Plug 'godlygeek/tabular'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Syntax Highlighting
Plug 'elixir-editors/vim-elixir',  { 'for': 'elixir' }
Plug 'lifepillar/pgsql.vim',       { 'for': 'sql' }
Plug 'pangloss/vim-javascript',    { 'for': ['javascript', 'javascriptreact'] }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescriptreact'] }
Plug 'maxmellon/vim-jsx-pretty',   { 'for': ['javascriptreact', 'typescriptreact'] }
Plug 'hashivim/vim-terraform',     { 'for': ['hcl', 'terraform'] }
" vim-fetch:
" vim path/to/file.ext:12:3 in the shell to open file.ext on line 12 at column 3
Plug 'kopischke/vim-fetch'
Plug 'mattn/emmet-vim', { 'for': ['javascript', 'javascript.jsx', 'typescript', 'typescript.jsx', 'html', 'css' ] }
Plug 'editorconfig/editorconfig-vim'
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

" annoying
set noswapfile

" visual mode show rows selected
set showcmd

" file encoding
set encoding=utf-8     " The encoding displayed.
set fileencoding=utf-8 " The encoding written to file.

" Spaces & Tabs
set tabstop=2 shiftwidth=2 expandtab " tabs to 2 spaces
set autoindent                       " autoindent

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

autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact
autocmd BufNewFile,BufRead *.cts set filetype=typescript
autocmd BufNewFile,BufRead *.mts set filetype=typescript
autocmd BufNewFile,BufRead *.gs  set filetype=javascript
autocmd BufNewFile,BufRead *.ejs set filetype=html

" UI
" Colors
if exists('$TMUX')
  set termguicolors
endif
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_bold=0
silent! colorscheme gruvbox
hi SpellBad                        cterm=underline
hi CocErrorHighlight               cterm=underline ctermfg=Red
hi CocWarningHighlight             cterm=underline
hi CocInfoHighlight                cterm=underline
hi CocHintHighlight                cterm=underline
hi CocDeprecatedHighlight          cterm=underline ctermfg=Yellow
hi CocUnusedHighlight              cterm=underline ctermfg=Yellow

set number
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set ruler               " shows row and column number at bottom right corner

" Always show file
set laststatus=2
set statusline+=%F

let g:coc_global_extensions = ['coc-diagnostic', 'coc-eslint', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-emmet', 'coc-solargraph']

if filereadable('~/dotfiles/cocconfig.vim')
  source ~/dotfiles/cocconfig.vim
endif

if filereadable('~/.vimrc.local')
  source ~/.vimrc.local
endif
