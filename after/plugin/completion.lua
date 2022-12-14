local icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "⌘",
	Field = "ﰠ",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "塞",
	Value = "",
	Enum = "",
	Keyword = "廓",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "פּ",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
	experimental = {
		native_menu = false,
		ghost_text = false,
	},
	completion = {
		completeopt = "menu,menuone,noinsert",
		keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
		keyword_length = 1,
	},
	formatting = {
		fields = { "kind", "abbr" },
		format = function(_, vim_item)
			vim_item.menu = vim_item.kind
			vim_item.kind = icons[vim_item.kind] or ""

			return vim_item
		end,
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
		-- ["<Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_next_item()
		-- 	elseif luasnip.expand_or_jumpable() then
		-- 		luasnip.expand_or_jump()
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),
		-- ["<S-Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_prev_item()
		-- 	elseif luasnip.jumpable(-1) then
		-- 		luasnip.jump(-1)
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		-- { name = "luasnip" }, -- For luasnip users.
		-- { name = 'buffer' },
		-- { name = 'rg' },
		{ name = "path" },
	}),
	preselect = cmp.PreselectMode.None,
})

--signature
require("lsp_signature").setup({
	bind = true, -- This is mandatory, otherwise border config won't get registered.
	hint_enable = false,
	handler_opts = {
		border = "none",
	},
	padding = " ",
})

--autopairs
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
