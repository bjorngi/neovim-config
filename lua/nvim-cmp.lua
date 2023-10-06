 -- luasnip setup
local luasnip = require 'luasnip'
local lspkind = require('lspkind')

-- nvim-cmp setup
local cmp = require 'cmp'
local compare = require('cmp.config.compare')
local misc = require('cmp.utils.misc')

local completionItemKind = {
	Text = 1,
	Method = 2,
	Function = 3,
	Constructor = 4,
	Field = 5,
	Variable = 6,
	Class = 7,
	Interface = 8,
	Module = 9,
	Property = 10,
	Unit = 11,
	Value = 12,
	Enum = 13,
	Keyword = 14,
	Snippet = 15,
	Color = 16,
	File = 17,
	Reference = 18,
	Folder = 19,
	EnumMember = 20,
	Constant = 21,
	Struct = 22,
	Event = 23,
	Operator = 24,
	TypeParameter = 25,
}

local myComperators = {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
     format = function(entry, vim_item)
	     vim_item.kind = lspkind.presets.default[vim_item.kind]
	     return vim_item
     end
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ['<Tab>'] = function(fallback)
    if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end
    ,
    ['<S-Tab>'] = function(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end
  },
  experimental = {
   ghost_text = false,
  },
  sources = {
    { name = 'nvim_lsp', priority = 1000 },
    { name = 'buffer' },
    { name = 'luasnip' },
    { name = 'path' }
  }
}
