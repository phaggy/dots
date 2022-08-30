local g = vim.g
local o = vim.o


o.termguicolors = true
o.fillchars='eob: ' -- Removes ~ before start of line
o.number = true
o.autoindent = true
o.clipboard='unnamedplus'
o.ignorecase  = true -- ignore case for searches
o.smartcase = true -- case sensitive if one of the characters is capital
o.autoread = true -- auto-reload files
o.mouse='a'
o.syntax='enable'
o.signcolumn='yes' -- symbol and number column colapses into one column
o.incsearch = true -- realtime search
o.background = 'dark'

vim.cmd('colorscheme deus')
-- vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
-- vim.cmd('colorscheme catppuccin')

g.mapleader = " "
