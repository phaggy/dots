set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

call plug#begin('~/.vim/plugged')

" Language server auto-install
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons' "File type icons
Plug 'nvim-telescope/telescope-file-browser.nvim' "NerdTree alternative

" Faster telescope search algorithm
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Lsp config
Plug 'neovim/nvim-lspconfig'

"LSP autocomplete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Themes
Plug 'ajmwagar/vim-deus'
Plug 'fratajczak/one-monokai-vim'

" Airline
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline' 

" Util
Plug 'mattn/emmet-vim' "emmet
Plug 'jiangmiao/auto-pairs' " closes brackets
Plug 'tpope/vim-commentary' " makes commenting easy
Plug 'airblade/vim-gitgutter' " shows git changes in files
Plug 'tpope/vim-fugitive' "git add remove commit push rebase etc all without ever having to leave vim
Plug 'diepm/vim-rest-console' "very much like vscode rest extension, make http requests from vim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " vim markdown preview
"Plug 'Yggdroot/indentLine' "shows line indents


call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vimrc
set fillchars=eob:\ , "Removes ~ before the start of every line
set laststatus=2
set tabstop=2 shiftwidth=2
set number
set expandtab
set autoindent
set autoread
set smarttab

nnoremap <leader>cd :Telescope find_files<CR>
map <C-n> :Telescope file_browser <CR>

"Load lua file
lua require("main")
nnoremap <leader>cb <cmd>lua require("main").curr_buf() <cr>
nnoremap <F4> :lua package.loaded.main = nil <cr>:source ~/.config/nvim/init.vim <cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Theme 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd vimenter * ++nested colorscheme one-monokai
colorscheme deus
set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1 "tabline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rest console 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable rest console default mapping
let g:vrc_set_default_mapping = 0
" binding the rest request thing to leader+mr, mr for make request
nnoremap <leader>mr :call VrcQuery()<CR>

let g:vrc_curl_opts = {
      \ '-s':'',
      \ '-i':'',
    \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>g :G<CR>
" git status
