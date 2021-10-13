require("toggleterm").setup{}
local v = require('vimp')

local Terminal  = require('toggleterm.terminal').Terminal

local lazygitTerminal = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  }
})


return {
  Lazygit = lazygitTerminal
}
