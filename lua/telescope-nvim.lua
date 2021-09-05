local trouble = require("trouble.providers.telescope")

require("telescope").setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
        preview_width = 0.65
      },
      vertical = {
        mirror = false
      },
      width = 0.95,
      preview_cutoff = 120,
      prompt_position = "bottom",
    },
    file_sorter = require "telescope.sorters".get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    color_devicons = true,
    use_less = true,
    set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
    file_previewer = require "telescope.previewers".vim_buffer_cat.new,
    grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
    qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker
  },
  extensions = {
    media_files = {
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    }
  }
}

require("telescope").load_extension("media_files")

local opt = {noremap = true, silent = true}

vim.g.mapleader = " "

-- mappings
vim.api.nvim_set_keymap("n", "<Leader>f", [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], opt)
vim.api.nvim_set_keymap(
"n",
"<Leader>P",
[[<Cmd>lua require('telescope').extensions.media_files.media_files()<CR>]],
opt
)

local wideDropdown = {layout_config={vertical={width = 0.75}}
}

vim.api.nvim_set_keymap("n", "<Leader>b", [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>k", [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>o", [[<Cmd>lua require('telescope.builtin').oldfiles()<CR>]], opt)
vim.api.nvim_set_keymap("n", "<C-Space>", [[<Cmd>lua require('telescope.builtin').lsp_document_diagnostics(require('telescope.themes').get_ivy())<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>gd", [[<Cmd>lua require('telescope.builtin').lsp_definitions(require('telescope.themes').get_ivy())<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>M", [[<Cmd> Neoformat<CR>]], opt)

require("my-functions")
-- dashboard stuff
vim.api.nvim_set_keymap("n", "<Leader>F", [[<Cmd> Telescope live_grep<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>N", [[<Cmd> DashboardNewFile<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>bm", [[<Cmd> DashboardJumpMarks<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>sl", [[<Cmd> SessionLoad<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>ss", [[<Cmd> SessionSave<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>n", [[<Cmd>lua require('my-functions')openBrowser()<CR>]], {})
