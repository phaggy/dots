set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'vim-airline/vim-airline-themes' 
Plug 'vim-airline/vim-airline' 
Plug 'chrisbra/Colorizer'
Plug 'tpope/vim-surround' 
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim'
Plug 'junegunn/fzf' 
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
set number
set expandtab
set tabstop=2 shiftwidth=2
set smarttab
set autoindent
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set cursorline
