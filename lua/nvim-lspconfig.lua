local lsp_installer = require("nvim-lsp-installer")
local lspconf = require("lspconfig")

lsp_installer.on_server_ready(function(server)
  local opts = {}

  if server.name == "sqls" then
    opts.on_attach = function(client)
      client.resolved_capabilities.execute_command = true
      client.commands = require('sqls').commands -- Neovim 0.6+ only

      require('sqls').setup{
        picker = 'telescope'
      }
    end
  elseif server.name == 'sumneko_lua' then
    local sumneko_binary_path = vim.fn.exepath('lua-language-server')
    local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h')
    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")

    opts.cmd = {sumneko_binary_path , "-E", sumneko_root_path .. "/main.lua"};
    opts.settings = {
      Lua = {
          runtime = {version = 'LuaJIT', path = runtime_path},
          diagnostics = {globals = {'vim'}},
          workspace = {
              library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true},
              preloadFileSize = 450
          }
        }
    }
    opts.diagnostics = {globals = {'vim'}}
    opts.workspace = {
      library = vim.api.nvim_get_runtime_file('', true),
    }

  elseif server.name == "ltex" then
    opts.settings = {
      ltex = {
        language = "no"
      }
    }
  end
  opts.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  opts.root_dir = lspconf.util.find_git_ancestor()
  server:setup(opts)
end)


-- replace the default lsp diagnostic letters with prettier symbols
vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})
