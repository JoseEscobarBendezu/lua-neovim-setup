local icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "⌘",
	Field = "ﰠ",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
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
			vim_item.kind = " " .. (icons[vim_item.kind] or "") .. " "

			return vim_item
		end,
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<A-e>"] = cmp.mapping.close(),
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<A-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		["<A-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		-- ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "path" },
	}),
	preselect = cmp.PreselectMode.None,
	-- new config
	window = {
		completion = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,
		},
	},
})

--autopairs
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
