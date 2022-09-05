local lspconfig = require("lspconfig")
local updated_capabilites = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- disabling inline messages
vim.diagnostic.config({
	-- virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = false,
})

-- Show line diagnostics automatically in hover window
-- vim.o.updatetime = 250
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

local function lsp_keymaps()
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = 'rounded',
				source = 'always',
				prefix = ' ',
				scope = 'cursor',
			}
			vim.diagnostic.open_float(nil, opts)
		end
	})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0 })
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
	vim.keymap.set("n", "n[", vim.diagnostic.goto_prev, { buffer = 0 })
	vim.keymap.set("n", "n]", vim.diagnostic.goto_next, { buffer = 0 })
	vim.keymap.set("n", "<leader>f", vim.lsp.buf.formatting, { buffer = 0 })
end

local servers = {
	bashls = true,
	eslint = true,
	-- graphql = true,
	html = true,
	pyright = true,
	vimls = true,
	yamlls = true,
	sumneko_lua = true,

	clangd = {
		cmd = {
			"clangd",
			"--background-index",
			"--suggest-missing-includes",
			"--clang-tidy",
			"--header-insertion=iwyu",
		},
		-- Required for lsp-status
		init_options = {
			clangdFileStatus = true,
		},
		handlers = nvim_status and nvim_status.extensions.clangd.setup() or nil,
	},

	rust_analyzer = {
		cmd = { "rustup", "run", "nightly", "rust-analyzer" },
		-- cmd = { "rust-analyzer" },
	},

	cssls = true,
	tsserver = {
		cmd = { "typescript-language-server", "--stdio" },
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
		on_attach = lsp_keymaps(),
	},
}

local setup_server = function(server, config)
	if not config then
		return
	end

	if type(config) ~= "table" then
		config = {}
	end

	config = vim.tbl_deep_extend("force", {
		on_attach = lsp_keymaps,
		capabilities = updated_capabilites,
		flags = {
			debounce_text_changes = nil,
		},
	}, config)

	lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
	setup_server(server, config)
end
