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
require('vgit-config')

require("test")
require("dap")

-- TODO: Do
require "neotest-config"
-- lsp stuff
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

-- git signs , lsp symbols etc
require "gitsigns-nvim"
require("lspkind-nvim")
require("nvim-autopairs").setup()

require('mason-config')

-- require("yaml-companion-config")

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

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
