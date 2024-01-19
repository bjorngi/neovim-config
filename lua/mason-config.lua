local lspconfig = require('lspconfig')
require("mason").setup()

require("mason-lspconfig").setup {
  ensure_installed = { "tsserver", "eslint", "cssls", "cssmodules_ls"},
  automatic_installation = true,
}


lspconfig.tsserver.setup {}
-- lspconfig.eslint.setup {}
lspconfig.biome.setup {}
lspconfig.cssls.setup {}
lspconfig.cssmodules_ls.setup {}


vim.fn.sign_define("DiagnosticSignError", {text = "", numhl = "DiagnosticSignError", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "", numhl = "DiagnosticSignWarn", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "", numhl = "DiagnosticSignInfo", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", numhl = "DiagnosticSignHint", texthl = "DiagnosticSignHint"})
