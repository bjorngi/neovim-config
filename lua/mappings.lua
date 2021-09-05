local v = require('vimp')

local telescope = require('telescope.builtin')
local telescopeTheme = require('telescope.themes')
local myFunc = require('my-functions')

-- open vim config
v.nnoremap('<leader>ev', ':e ~/.config/nvim/init.lua<cr>')

-- go to definition
v.bind('n', 'gD', function ()
  vim.lsp.buf.declaration()
end)

-- show implementations
v.bind('n', 'gi', function ()
  telescope.lsp_implementations(telescopeTheme.get_ivy())
end)

-- show docs
v.bind('n', 'K', function ()
  vim.lsp.buf.hover()
end)

-- show method signatures
v.bind('n', '<C-k>', function ()
  vim.lsp.buf.signature_help()
end)

--- show code actions
v.bind('n', '<leader><space>', function ()
  telescope.lsp_code_actions()
end)

-- go to references
v.bind('n', 'gr', function ()
  telescope.lsp_references(telescopeTheme.get_ivy())
end)

-- show diagnostics
v.bind('n', '<leader>q', function ()
  telescope.lsp_document_diagnostics()
end)

v.bind('n', '<leader>Q', function ()
  telescope.lsp_workspace_diagnostics()
end)

-- show type definition
v.bind('n', '<leader>D', function ()
  vim.lsp.buf.type_definition()
end)

-- TABS
v.nnoremap('<S-t>', ':tabnew<CR>')
v.nnoremap('<S-x>', ':bdelete<CR>')

v.nnoremap('<TAB>', ':BufferLineCycleNext<CR>')
v.nnoremap('<S-TAB>', ':BufferLineCyclePrev<CR>')

-- show files in directory
v.bind('n', '<leader>n', function ()
  telescope.file_browser({ cwd = vim.fn.expand('%:p:h') })
end)

-- show files edited
v.bind('n', '<leader>o', function ()
  telescope.oldfiles()
end)

-- show open buffers
v.bind('n', '<leader>b', function ()
  telescope.buffers(telescopeTheme.get_ivy())
end)

-- show help
v.bind('n', '<leader>k', function ()
  telescope.help_tags()
end)

-- search files
v.bind('n', '<leader>f', function ()
  telescope.find_files()
end)

v.bind('n', '<leader>F', function ()
  telescope.live_grep({ prompt_prefix="🔍 " })
end)