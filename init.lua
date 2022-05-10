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

require("test")
require("dap")
-- lsp stuff
require "nvim-lspconfig"
require "nvim-cmp"
require "lsp_signature-config"

vim.g.mapleader = " "

-- colorscheme related stuff
vim.cmd "syntax on"
vim.cmd "set termguicolors"

-- Load the colorscheme
require('onedark').setup()
require('onedark').load()

require "treesitter-nvim"
require "mappings"

require "telescope-nvim"
require "file-icons"
require "ultest-config"

-- git signs , lsp symbols etc
require "gitsigns-nvim"
require("lspkind-nvim")
require("nvim-autopairs").setup()

-- set global statusline
vim.opt.laststatus = 3

-- format on save
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
