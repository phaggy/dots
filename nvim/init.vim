set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

call plug#begin('~/.vim/plugged')

" python code formatter
Plug 'psf/black', { 'branch': 'stable' }
" Nerdtree
Plug 'preservim/nerdtree'
" emmet
Plug 'mattn/emmet-vim'
" preview color
Plug 'ap/vim-css-color'
" Airline
Plug 'vim-airline/vim-airline-themes' 
Plug 'vim-airline/vim-airline' 
" hex to color
Plug 'chrisbra/Colorizer'
" 
"Plug 'tpope/vim-surround' 
"Auto-complete/intellisense
Plug 'neoclide/coc.nvim'
Plug 'neoclide/coc-eslint'
" auto formatter
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
" fuzzy file search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Theme
" Plug 'fratajczak/one-monokai-vim'
" Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'ajmwagar/vim-deus'

" javascript syntax highlighting
" Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'

Plug 'jiangmiao/auto-pairs' " closes brackets

Plug 'ryanoasis/vim-devicons' " icons for nerd tree

Plug 'airblade/vim-gitgutter' " shows git changes in files

" git add and commit from vim itself
Plug 'tpope/vim-fugitive'
"Plug 'yuezk/vim-js'
Plug 'tpope/vim-commentary'

" work with rest in vim
Plug 'diepm/vim-rest-console'

" Initialize plugin system
call plug#end()

source ~/.vimrc
set fillchars=eob:\ , "Removes ~ before the start of every line
let g:powerline_pycmd = 'py3'
set laststatus=2

" Theme section
"autocmd vimenter * ++nested colorscheme one-monokai
colorscheme deus
set background=dark
"airline section"
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1 "tabline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '>'

"reload file
nnoremap <leader><C-r> :source $HOME/dots/nvim/init.vim<CR><CR>

" disable the rest somethings default mapping
let g:vrc_set_default_mapping = 0
" binding the rest request thing to leader+mr, mr for make request
nnoremap <leader>mr :call VrcQuery()<CR>

"rest thing, this basically gives cleaner output
let g:vrc_curl_opts = {
      \ '-s':'',
      \ '-i':'',
    \}

" NerdTree section
map <C-n> :NERDTreeToggle <bar> :NERDTreeRefreshRoot<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'


" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

map <C-d> :Files<CR>
" fuzzy search
map <C-g> :G<CR>
" git status
map <C-a> :Gwrite<CR>
" git add
map <C-g>r :Git restore --staged ''%:p''<CR>
" removes staged file
map <C-c> :Git commit<CR>

nnoremap <silent> K :call CocAction('doHover')<CR>

" coc-snippets expand and jump
imap <C-j> <Plug>(coc-snippets-expand-jump)

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

" coc stuff
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


inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that

" runs black on save
autocmd BufWritePre *.py execute ':Black'
