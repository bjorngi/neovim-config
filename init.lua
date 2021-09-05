-- load all plugins
require "pluginList"
require "misc-utils"

require "top-bufferline"
require "statusline"

require("colorizer").setup()
require("neoscroll").setup() -- smooth scroll

-- lsp stuff
require "nvim-lspconfig"
require "compe-completion"

local cmd = vim.cmd
local g = vim.g

g.mapleader = " "
g.auto_save = 0

-- colorscheme related stuff
cmd "syntax on"
cmd "set termguicolors"

vim.g.nightfox_style = "nordfox"
vim.g.nightfox_color_delimiter = "red"
vim.g.nightfox_italic_comments = 1

-- Load the colorscheme
require('nightfox').set()

-- require "highlights"

-- blankline

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
require("nvim-autopairs").setup()
require("lspkind").init()

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

require("nvim_comment").setup()

-- Lua
