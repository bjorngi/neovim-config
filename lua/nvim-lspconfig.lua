local function setup_servers()
  require "lspinstall".setup()

  local lspconf = require("lspconfig")
  local servers = require "lspinstall".installed_servers()

  for _, lang in pairs(servers) do
    if lang == "typescript" then
      lspconf[lang].setup {
        root_dir = lspconf.util.find_git_ancestor(),
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
      }

    elseif lang == "lua" then
      lspconf[lang].setup {
        root_dir = lspconf.util.find_git_ancestor(),
        settings = {
          Lua = {
            diagnostics = {
              globals = {"vim"}
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
              }
            },
            telemetry = {
              enable = false
            }
          }
        }
      }
    else
      lspconf[lang].setup {
        root_dir = lspconf.util.find_git_ancestor()
      }
    end
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require "lspinstall".post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- replace the default lsp diagnostic letters with prettier symbols
vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})
