local lsp_installer = require("nvim-lsp-installer")
local lspconf = require("lspconfig")

lsp_installer.on_server_ready(function(server)
  local opts = {}

  if server.name == "tsserver" then
    opts.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    opts.root_dir = lspconf.util.find_git_ancestor()
  elseif server.name == "sqls" then
    opts.on_attach = function(client)
      client.resolved_capabilities.execute_command = true
      client.commands = require('sqls').commands -- Neovim 0.6+ only

      require('sqls').setup{
        picker = 'telescope'
      }
    end
  elseif server.name == "ltex" then
    opts.settings = {
      ltex = {
        language = "no"
      }
    }
  else
  end

  opts.root_dir = lspconf.util.find_git_ancestor()
  server:setup(opts)
end)


-- replace the default lsp diagnostic letters with prettier symbols
vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})
