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
require("lualine").setup()
require("nvim-tree").setup()
