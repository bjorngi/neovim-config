-- load all plugins
require "pluginList"
require "misc-utils"

require "top-bufferline"
require "statusline"

require("colorizer").setup()
require("neoscroll").setup() -- smooth scroll

require("goto-preview-config")
require("toggleterminal-conf")
require("neogit-config")

-- lsp stuff
require "nvim-lspconfig"
require "sumneko-lspconfig"
-- require "compe-completion"
require "nvim-cmp"
require "lsp_signature-config"

local cmd = vim.cmd
local g = vim.g

g.mapleader = " "
g.auto_save = 0

-- colorscheme related stuff
cmd "syntax on"
cmd "set termguicolors"

-- Load the colorscheme
-- g.onedark_style = 'darker'
require('onedark').setup()

g.indentLine_enabled = 1
g.indent_blankline_char = "▏"

g.indent_blankline_filetype_exclude = {"help", "terminal"}
g.indent_blankline_buftype_exclude = {"terminal"}

g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false

require "treesitter-nvim"
require "mappings"

require "telescope-nvim"
require "file-icons"

-- git signs , lsp symbols etc
require "gitsigns-nvim"
require("lspkind-nvim")
require("nvim-autopairs").setup()

-- orgmode
require("orgmode-nvim")

-- hide line numbers , statusline in specific buffers!
vim.api.nvim_exec(
    [[
   au BufEnter term://* setlocal nonumber
   au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
   au BufEnter term://* set laststatus=0 
]],
    false
)

vim.api.nvim_exec(
[[
  augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
  augroup END
]],
false
)

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

require("nvim_comment").setup()
