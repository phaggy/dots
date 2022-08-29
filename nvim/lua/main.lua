CAPABILITIES = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = CAPABILITIES,
		on_attach = function()
      vim.keymap.set("n","K", vim.lsp.buf.hover, {buffer=0})
	    vim.keymap.set("n","gd", vim.lsp.buf.definition, {buffer=0})
	    vim.keymap.set("n","<leader>rn", vim.lsp.buf.rename, {buffer=0})
	    vim.keymap.set("n","gt", vim.lsp.buf.type_definition, {buffer=0})
	    vim.keymap.set("n","gi", vim.lsp.buf.implementation, {buffer=0})
	    vim.keymap.set("n","<leader>dj", vim.diagnostic.goto_next, {buffer=0})
			
		end,
	}, _config or {})
end

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup()

-- Native LSP Setup
--
-- Rust analyzer
require('lspconfig').rust_analyzer.setup(config())
-- ESlint
require'lspconfig'.eslint.setup(config())
-- tsserver
require'lspconfig'.tsserver.setup(config())
-- Lua
require'lspconfig'.sumneko_lua.setup(config())
-- CSS
require("lspconfig").cssls.setup(config())

-- Treesitter config
require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

-- Telescope Setup
local action_state = require('telescope.actions.state') -- runtime Plugin
require('telescope').setup{
	defaults = {
		prompt_prefix = "$ ",
		mappings = {}
	}

}
require('telescope').load_extension('fzf')
require("telescope").load_extension "file_browser"

local mappings = {}

mappings.curr_buf = function()
	local opts = require('telescope.themes').get_dropdown({ height=10, previewer=false })
	require('telescope.builtin').current_buffer_fuzzy_find(opts)
end

vim.opt.complete.opt={"menu","menuone","noselect"}

-- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif vim.fn["vsnip#available"](1) == 1 then
          feedkey("<Plug>(vsnip-expand-or-jump)", "")
        elseif has_words_before() then
          cmp.complete()
        else
          fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
          feedkey("<Plug>(vsnip-jump-prev)", "")
        end
      end, { "i", "s" }),
      ['<S-Tab>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

return mappings
