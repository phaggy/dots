-- Setup nvim-cmp.
local cmp = require("cmp")

local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	path = "[Path]",
}

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.select_prev_item(),
    ["<S-Tab>"] = cmp.mapping.select_next_item(),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(t "<C-n>", "n")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(t "<C-p>", "n")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
	}),

	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
	},
})
