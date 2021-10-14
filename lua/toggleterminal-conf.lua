require("toggleterm").setup{}
local v = require('vimp')

local Terminal  = require('toggleterm.terminal').Terminal

local htopTerminal = Terminal:new({
  cmd = "htop",
  direction = "float",
  float_opts = {
    border = "double",
  },
})


return {
  Htop = htopTerminal
}
