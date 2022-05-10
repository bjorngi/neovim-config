local lspconf = require("lspconfig")

local currentWorkspace = lspconf.util.find_git_ancestor(vim.api.nvim_buf_get_name(0))
print(currentWorkspace)
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
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "vertical",
    layout_config = {
      horizontal = {
        mirror = false,
        preview_width = 0.65 },
      vertical = {
        mirror = false
      },
      width = 0.99,
      preview_cutoff = 120,
      prompt_position = "bottom",
    },
    file_sorter = require "telescope.sorters".get_fuzzy_file,
    -- file_ignore_patterns = { "node_modules" },
    generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
    winblend = 0,
    color_devicons = true,
    use_less = true,
    set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
    -- Developer configurations: Not meant for general override
    -- buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_cursor(),
    },
    media_files = {
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    },
    frecency = {
      default_workspace = 'cur',
      workspaces = {
        ["cur"] = lspconf.util.find_git_ancestor(vim.fn.getcwd()),
      },
      show_scores = true,
    }
  }
}
require("telescope").load_extension "file_browser"
require("telescope").load_extension("ui-select")
require("telescope").load_extension("frecency")
require("telescope").load_extension("frecency")
