-- Telescope Setup
require('telescope').load_extension('fzf')
require('telescope').setup {
	defaults = {
		prompt_prefix = "$ ",
		mappings = {}
	},
}
local action_state = require('telescope.actions.state') -- runtime Plugin

local mappings = {}

mappings.curr_buf = function()
	local opts = require('telescope.themes').get_dropdown({ height = 10, previewer = false })
	require('telescope.builtin').current_buffer_fuzzy_find(opts)
end

vim.opt.complete.opt = { "menu", "menuone", "noselect" }
