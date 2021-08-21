local g = vim.g
local M = {}

vim.o.termguicolors = true

g.nvim_tree_side = "left"
g.nvim_tree_width = 25
g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
g.nvim_tree_auto_open = 0
g.nvim_tree_auto_close = 0
g.nvim_tree_quit_on_open = 0
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_root_folder_modifier = ":t"
g.nvim_tree_tab_open = 0
g.nvim_tree_allow_resize = 1

g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1
}

g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★",
    deleted = "",
    ignored = "◌"
  },
  folder = {
    default = "",
    open = "",
    symlink = "",
    empty = "",
    empty_open = "",
    symlink_open = ""
  }
}
-- Mappings for nvimtree

vim.api.nvim_set_keymap(
"n",
"<C-n>",
":NvimTreeToggle<CR>",
{
  noremap = true,
  silent = true
}
)

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local bindings = {
  ["<CR>"]           = tree_cb("edit"),
  ["o"]              = ":lua NvimTreeConfig.xdg_open()<CR>",
  ["<2-LeftMouse>"]  = tree_cb("edit"),
  ["<2-RightMouse>"] = tree_cb("cd"),
  ["<C-]>"]          = tree_cb("cd"),
  ["<C-t>"]          = tree_cb("tabnew"),
  ["v"]              = tree_cb("vsplit"),
  ["s"]              = tree_cb("split"),
  ["<BS>"]           = tree_cb("close_node"),
  ["<S-CR>"]         = tree_cb("close_node"),
  ["P"]              = tree_cb("parent_node"),
  ["h"]              = tree_cb("close_node"),
  ["l"]              = tree_cb("edit"),
  ["K"]              = tree_cb("first_sibling"),
  ["J"]              = tree_cb("last_sibling"),
  ["<Tab>"]          = tree_cb("preview"),
  ["I"]              = tree_cb("toggle_ignored"),
  ["H"]              = tree_cb("toggle_dotfiles"),
  ["R"]              = tree_cb("refresh"),
  ["a"]              = tree_cb("create"),
  ["d"]              = tree_cb("remove"),
  ["r"]              = tree_cb("rename"),
  ["<C-r>"]          = tree_cb("full_rename"),
  ["x"]              = tree_cb("cut"),
  ["y"]              = tree_cb("copy"),
  ["p"]              = tree_cb("paste"),
  ["[c"]             = tree_cb("prev_git_item"),
  ["]c"]             = tree_cb("next_git_item"),
  ["-"]              = tree_cb("dir_up"),
  ["q"]              = tree_cb("close"),
}

local function setup_bindings(buf_id)
  for key, cb in pairs(bindings) do
    vim.api.nvim_buf_set_keymap(
    buf_id, "n", key, cb,
    { noremap = true, silent = true, nowait = true }
    )
  end
end

function M.custom_setup()
  local buf_id = vim.api.nvim_get_current_buf()
  local ok, custom_setup_done = pcall(vim.api.nvim_buf_get_var, buf_id, "custom_setup_done")

  if ok and custom_setup_done == 1 then
    return
  end

  vim.api.nvim_buf_set_var(buf_id, "custom_setup_done", 1)
  setup_bindings(buf_id)
end
