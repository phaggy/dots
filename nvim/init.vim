set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

call plug#begin('~/.vim/plugged')

" formatters
Plug 'psf/black', { 'branch': 'stable' } " python formatter
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript','javascriptreact', 'typescript','typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html','svelte'] } " js,json etv formatter
Plug 'rhysd/vim-clang-format' "C/C++ formatter

"Auto-complete/intellisense
Plug 'neoclide/coc.nvim',{'branch': 'release'}

" linters
Plug 'neoclide/coc-eslint' "eslint

" Syntax highlighting
Plug 'sheerun/vim-polyglot' "js,json,jsx etc syntax highlighting
Plug 'ap/vim-css-color' " css preview color
Plug 'chrisbra/Colorizer' " hex to color
Plug 'hail2u/vim-css3-syntax' "css syntax highlighting
Plug 'cakebaker/scss-syntax.vim' "scss syntax highlighting
" Plug 'jackguo380/vim-lsp-cxx-highlight' "C/C++ highlighting

" Themes
Plug 'ajmwagar/vim-deus'
Plug 'fratajczak/one-monokai-vim'
" Plug 'rakr/vim-one'
" Plug 'joshdick/onedark.vim'

" Airline
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline' 

" Utils
Plug 'preservim/nerdtree' " Nerdtree
Plug 'ryanoasis/vim-devicons' " icons for nerd tree
Plug 'mattn/emmet-vim' "emmet
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy file search
Plug 'junegunn/fzf.vim' 
Plug 'jiangmiao/auto-pairs' " closes brackets
Plug 'tpope/vim-commentary' " makes commenting easy
Plug 'airblade/vim-gitgutter' " shows git changes in files
Plug 'tpope/vim-fugitive' "git add remove commit push rebase etc all without ever having to leave vim
Plug 'diepm/vim-rest-console' "very much like vscode rest extension, make http requests from vim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " vim markdown preview
Plug 'Yggdroot/indentLine' "shows line indents

" Live browser
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vimrc
set fillchars=eob:\ , "Removes ~ before the start of every line
"let g:powerline_pycmd = 'py3'
set laststatus=2
" set timeoutlen=1000        " speed vim up
" set ttimeoutlen=0          " https://stackoverflow.com/questions/37644682/why-is-vim-so-slow/37645334
" set ttyfast                " Rendering
" set tw=500
"reload init.vim
nnoremap <leader><C-r> :source $HOME/dots/nvim/init.vim<CR><CR>
set autoread                  " reload files

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => IndentLine 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_setColors = 0

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

"rest thing, this basically gives cleaner output
let g:vrc_curl_opts = {
      \ '-s':'',
      \ '-i':'',
    \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle <bar> :NERDTreeRefreshRoot<CR>
autocmd VimEnter * NERDTree "Toggles Nerdtree on vim open
let NERDTreeQuitOnOpen = 1 "closes NerdTree when opening a file
let g:NERDTreeIgnore = ['^node_modules$']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Prettier
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Black
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" runs black on save
autocmd BufWritePre *.py execute ':Black'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-g> :G<CR>
" git status
map <C-a> :Gwrite<CR>
" git add
map <C-g>r :Git restore --staged ''%:p''<CR>
" removes staged file
" map <C-c> :Git commit<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-d> :Files<CR>
nnoremap <leader>cd :Rg<CR>
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
" fuzzy search

" nnoremap <silent> K :call CocAction('doHover')<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => COC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rename
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif



"coc-snippets expand and jump
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => COC misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
