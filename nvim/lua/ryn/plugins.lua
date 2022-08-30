return require('packer').startup({
	function(use)

-- Language server auto-install
use 'williamboman/mason.nvim'
use 'williamboman/mason-lspconfig.nvim'

-- Treesitter
 use(
            {
                'nvim-treesitter/nvim-treesitter',
                run = ':TSUpdate',
            }
        )

-- Telescope
use 'nvim-lua/popup.nvim'
use 'nvim-lua/plenary.nvim'
use 'nvim-telescope/telescope.nvim'
use 'kyazdani42/nvim-web-devicons' --File type icons
use {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
} --NerdTree alternative

-- Faster telescope search algorithm
use({'nvim-telescope/telescope-fzf-native.nvim',run= 'make'})

-- Lsp config
use 'neovim/nvim-lspconfig'

--LSP autocomplete
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'L3MON4D3/LuaSnip'
use 'saadparwaiz1/cmp_luasnip'

-- Themes
use 'ajmwagar/vim-deus'
use 'fratajczak/one-monokai-vim'
use 'joshdick/onedark.vim'
use { "catppuccin/nvim", as = "catppuccin" }

-- Airline
-- use 'vim-airline/vim-airline-themes'
-- use 'vim-airline/vim-airline' 
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}

-- Util
use 'mattn/emmet-vim' --emmet
use 'jiangmiao/auto-pairs' -- closes brackets
use 'tpope/vim-commentary' -- makes commenting easy
use 'airblade/vim-gitgutter' -- shows git changes in files
use 'tpope/vim-fugitive' --git add remove commit push rebase etc all without ever having to leave vim
use 'diepm/vim-rest-console' --very much like vscode rest extension, make http requests from vim
use({'iamcco/markdown-preview.nvim', run='cd app && yarn install'}) -- vim markdown preview
--use 'Yggdroot/indentLine' --shows line indents
end,
})


