local v = require('vimp')
local telescope = require('telescope.builtin')
local telescopeExt = require('telescope').extensions
local trouble = require("trouble.providers.telescope")
local telescopeTheme = require('telescope.themes')
local terminals = require("toggleterminal-conf")
local diffview = require("diffview")
local neogit = require("neogit")
local wk = require('which-key')
local gp = require('goto-preview')

wk.setup({
  ignore_missing = true
})

-- open vim config
v.nnoremap('<leader>ev', ':e ~/.config/nvim/init.lua<cr>')

-- show docs
v.bind('n', 'K', function ()
  vim.lsp.buf.hover()
end)

-- show method signatures
v.bind('n', '<C-k>', function ()
  vim.lsp.buf.signature_help()
end)

-- TABS
v.nnoremap('<S-t>', ':tabnew<CR>')
v.nnoremap('<S-x>', ':bdelete<CR>')

v.nnoremap('<TAB>', ':BufferLineCycleNext<CR>')
v.nnoremap('<S-TAB>', ':BufferLineCyclePrev<CR>')

wk.register({
  s = {
    name = "Symbols",
    e = { function () require'telescope.builtin'.symbols{ sources = {'emoji'} } end, "Emojis 👏" },
    g = { function () require'telescope.builtin'.symbols{ sources = {'gitmoji'} } end, "Gitmojis" }
  },
  f = { function () telescope.find_files() end, "Find file" },
  F = { function () telescope.live_grep({ prompt_prefix="🔍 " }) end, "Find word"},
  k = { function () telescope.help_tags() end, "Help" },
  c = {
    name = "Code actions",
    r = { function () vim.lsp.buf.rename() end, "Rename" },
    f = { function () vim.lsp.buf.formatting() end, "Format"},
    c = { function () telescope.lsp_code_actions(telescopeTheme.get_cursor()) end, "Action list"}
  },
  g = {
    name = "GOTO",
    d = { function () telescope.lsp_definitions() end, "Definition" },
    i = { function () telescope.lsp_implementations(telescopeTheme.get_ivy()) end, "implementation"},
    r = { function () telescope.lsp_references(telescopeTheme.get_ivy()) end, "References"},
    t = { function () telescope.lsp_type_definitions() end, "Type"},
    s = { function () telescope.lsp_document_symbols() end, "Symbols in file" },
    S = { function () telescope.lsp_dynamic_workspace_symbols() end, "Symbols in workspace" },
    p = {
      name = "Peek",
      d = { function() gp.goto_preview_definition() end, "Definition"},
      i = { function() gp.goto_preview_implementation() end, "Implementation"},
      r = { function() gp.goto_preview_references() end, "References"},
      P = { function () gp.close_all_win() end, "Close"}
    }
  },
  -- n = { function() telescope.extensions.file_browser({ cwd = vim.fn.expand('%:p:h') }) end, "Show folder"},
  n = { function() telescopeExt.file_browser.file_browser({ cwd = vim.fn.expand('%:p:h') }) end, "Show folder"},
  O = { function () telescope.oldfiles() end, "Recent files"},
  q = { function () telescope.diagnostics(telescopeTheme.get_ivy({ previewer = false, bufnr = 0 })) end, "Errors in file"},
  Q = { function () telescope.diagnostics(telescopeTheme.get_ivy({ previewer = false })) end, "Errors in workspace"},
  G = {
    name = "Git",
    d = { function() diffview.open() end, "Diff" },
    D = { function () diffview.close() end, "Close diff"},
    f = { function () diffview.file_history() end, "History"},
    g = { function () neogit.open() end, "Open interactive"},
    G = { function () neogit.close() end, "Close interactive"},
  },
  t = {
    name = "Testing",
    T = { "<cmd>Ultest<cr><cmd>UltestSummaryOpen<cr>", "Test file"},
    t = { "<cmd>UltestNearest<cr>", "Test file"},
    s = { "<cmd>UltestSummary<cr>", "Summary"},
    o = { "<cmd>UltestOutput<cr>", "Output"},
    l = { "<cmd>UltestLast<cr>", "Last"},
    c = { "<cmd>UltestClear<cr>", "Clear"},
  },
  b = { function() telescope.buffers(telescopeTheme.get_ivy()) end, "Buffers"},

}, { prefix = "<leader>"})
