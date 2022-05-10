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

myComperators.isImportantKind = function (entry1, entry2)
   local entry1Kind = entry1.completion_item.kind
   local entry2Kind = entry2.completion_item.kind
   local importantKinds = {completionItemKind.Constant, completionItemKind.Function, completionItemKind.Field}

   if entry1Kind == entry2Kind then
     return false
   end

   local entry1ImporantKind = false
   for _, kind in ipairs(importantKinds) do
     if kind == entry1Kind then
       entry1ImporantKind = true
     end
   end

   local entry2ImporantKind = false
   for _, kind in ipairs(importantKinds) do
     if kind == entry1Kind then
       entry2ImporantKind = true
     end
   end

   if (entry1ImporantKind and not entry2ImporantKind) then
     return true
   end

   return false
end

myComperators.inSameFile = function (entry1, entry2)
   -- print(vim.inspect(entry1.resolved_completion_item))
   -- print(vim.inspect(entry1.source))
   -- print(vim.inspect(entry1.completion_item))
   local entryFile1 = entry1:get_completion_item().data.file
   local entryFile2 = entry2:get_completion_item().data.file
   print(vim.inspect(entry1:get_completion_item()))
   if (entryFile1 and entryFile2 == nil) then
     print('TRUE')
     return true
   end
--   if misc.safe(cmpData) then
--     local cmpEntries = cmpData.entryNames[1]
--     if misc.safe(cmpEntries) then
--       local cmpEntryData = cmpEntries.data
--          print(vim.inspect(cmpEntryData))
--       if misc.safe(cmpEntryData) then
--         local moduleSpecifier = cmpEntryData
--         if misc.safe(moduleSpecifier) then
--          print(vim.inspect(moduleSpecifier))
--         end
--       end
--     end
--   end
   --for key, _ in pairs(entry1) do
   --  print(key)kkk
   --end
   -- print('------')

   return false
end

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
  sorting = {
    priority_weight = 2,
    comparators = {
      -- myComperators.inSameFile,
      myComperators.isImportantKind,
      compare.offset,
      compare.exact,
      compare.score,
      compare.recently_used,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    },
  },

  experimental = {
   ghost_text = true,
  },
  sources = {
    { name = 'nvim_lsp', priority = 1000 },
    { name = 'buffer' },
    { name = 'luasnip' }
  }
}
