function openBrowser ()
  require('telescope.builtin').file_browser({ cwd = vim.fn.expand('%:p:h') })
end

