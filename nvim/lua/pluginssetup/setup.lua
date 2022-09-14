require("mason").setup()
require("mason-lspconfig").setup({
	automatic_installation = true,
})

require("telescope")
-- Treesitter config
require('nvim-treesitter.configs').setup {
	ensure_installed = "all",
	sync_install = false,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
require("bufferline").setup{
	options = {
		separator_style = "padded_slant",
		mode = "tabs",
		diagnostics = "nvim_lsp",
		show_buffer_icons = false, -- disable filetype icons for buffers
		show_buffer_default_icon = false, -- whether or not an unrecognised filetype should show a default icon
		show_buffer_close_icons = false,
		show_close_icon = false,
	}
}
require("lualine").setup({
    -- options = { theme = 'horizon' }
    options = { theme = 'onedark' }
})
require("nvim-tree").setup()
