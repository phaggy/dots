local g = vim.g
local set = vim.opt

set.termguicolors = true
set.cursorline = true -- highlights the current line in the editor
set.fillchars='eob: ' -- Removes ~ before start of line
set.number = true
set.autoindent = true
set.tabstop = 2 -- number of spaces for tabs
set.shiftwidth=2 -- number of spaces when indenting the text
set.clipboard='unnamedplus'
set.ignorecase  = true -- ignore case for searches
set.smartcase = true -- case sensitive if one of the characters is capital
set.autoread = true -- auto-reload files
set.mouse='a'
set.syntax='enable'
set.signcolumn='yes' -- symbol and number column colapses into one column
set.incsearch = true -- realtime search
set.background = 'dark'
set.completeopt = "noinsert,menuone,noselect" -- better completion
set.wildmenu = true -- better completion menu

vim.cmd('colorscheme deus')
-- vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
-- vim.cmd('colorscheme catppuccin')

g.mapleader = " "
