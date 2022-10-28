local telescope = require('telescope.builtin')
local telescopeExt = require('telescope').extensions
local trouble = require("trouble")
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
vim.keymap.set('n', '<leader>ev', ':e ~/.config/nvim/init.lua<cr>')

-- show docs
vim.keymap.set('n', 'K', function ()
  vim.lsp.buf.hover()
end)

-- show method signatures
vim.keymap.set('n', '<C-k>', function ()
  vim.lsp.buf.signature_help()
end)

local function filterQuickfix(data)
  print(vim.inspect(pairs(data)))
  print(pairs(data))
  return true
end

-- TABS
vim.keymap.set('n', '<S-t>', ':tabnew<CR>', { silent = true})
vim.keymap.set('n', '<S-x>', ':bdelete<CR>', { silent = true })

vim.keymap.set('n', '<TAB>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<S-TAB>', ':BufferLineCyclePrev<CR>')

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
    c = { function () vim.lsp.buf.code_action() end, "Action list"},
    C = { function () vim.lsp.buf.code_action({ filter = filterQuickfix, apply = true }) end, "Fix all"}
  },
  g = {
    name = "GOTO",
    d = { function () telescope.lsp_definitions() end, "Definition" },
    -- d = { function () telescope.lsp_definitions() end, "Definition" },
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
  o = { function () telescopeExt.frecency.frecency({ workspace = 'CWD'}) end, "List frequent files"},
  q = { function () telescope.diagnostics(telescopeTheme.get_ivy({ previewer = false, bufnr = 0, line_width = 10 })) end, "Errors in file"},
  -- q = { function () trouble.toggle() end, "Errors in file"},
  Q = { function () telescope.diagnostics(telescopeTheme.get_ivy({ previewer = false })) end, "Errors in workspace"},
  G = {
    name = "Git",
    s = { function() require('vgit').buffer_hunk_stage() end, "Hunk stage" },
    r = { function() require('vgit').buffer_hunk_reset() end, "Hunk reset" },
    p = { function() require('vgit').buffer_hunk_preview() end,"Hunk preview" },
    b = { function() require('vgit').buffer_blame_preview() end, "Blame preview" },
    f = { function() require('vgit').buffer_diff_preview() end, "Diff preview" },
    h = { function() require('vgit').buffer_history_preview() end, "History preview" },
    u = { function() require('vgit').buffer_reset() end, "Buffer reset" },
    g = { function() require('vgit').buffer_gutter_blame_preview() end, "Gutter blame" },
    lu = { function() require('vgit').buffer_hunks_preview() end, "Hunks preview" },
    ls = { function() require('vgit').project_hunks_staged_preview() end, "Hunks staged preview" },
    d = { function() require('vgit').project_diff_preview() end, "Project diff" },
    q = { function() require('vgit').project_hunks_qf() end, "QF?" },
    x = { function() require('vgit').toggle_diff_preference() end, "Diff preferance" },
--    d = { function() diffview.open() end, "Diff" },
--    D = { function () diffview.close() end, "Close diff"},
--    f = { function () diffview.file_history() end, "History"},
--    g = { function () neogit.open() end, "Open interactive"},
--    G = { function () neogit.close() end, "Close interactive"},
  },
  t = {
    name = "Testing",
    a = { function() require("neotest").run.run({ suite = true }) end, "Test all"},
    T = { function() require("neotest").run.run() end, "Test file"},
    r = { function() require("neotest").run.run_last() end, "Test last"},
    m = { function() require("neotest").summary.run_marked() end, "Test marked"},
    M = { function() require("neotest").summary.clear_marked() end, "Clear marked"},
    t = { function() require("neotest").run.run(vim.fn.expand("%")) end, "Test file"},
    s = { function() require("neotest").summary.toggle() end, "Summary"},
    o = { function() require("neotest").output.open({ short = true }) end, "Output short"},
    O = { function() require("neotest").output.open({ enter = true }) end, "Output"},
    j = { function() require("neotest").jump.next({ status = 'failed'}) end, "Next fail"},
    k = { function() require("neotest").jump.prev({ status = 'failed'}) end, "Prev fail"},
  },
  b = { function() telescope.buffers(telescopeTheme.get_ivy()) end, "Buffers"},
  d = { function() vim.lsp.diagnostic.open_float() end, "Show error"}

}, { prefix = "<leader>"})
