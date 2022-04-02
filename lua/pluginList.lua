local packer = require("packer")
local use = packer.use

-- using { } for using different branch , loading plugin with certain commands etc
return packer.startup(
function()
	use "wbthomason/packer.nvim"
  -- lightspeed = s to search
  -- use 'ggandor/lightspeed.nvim'
  use 'rmagatti/goto-preview'
  use "akinsho/toggleterm.nvim"
  use 'nanotee/sqls.nvim'
  use { 'TimUntersberger/neogit', requires = {
     'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim'

    }
  }
  -- testing/debugging
  use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}}
  use {
  "mfussenegger/nvim-dap",
  opt = true,
  event = "BufReadPre",
  module = { "dap" },
  wants = { "nvim-dap-virtual-text", "DAPInstall.nvim", "nvim-dap-ui", "nvim-dap-python", "which-key.nvim" },
  requires = {
    "Pocco81/DAPInstall.nvim",
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
    "nvim-telescope/telescope-dap.nvim",
    { "leoluz/nvim-dap-go", module = "dap-go" },
    { "jbyuki/one-small-step-for-vimkind", module = "osv" },
  },
  config = function()
    --require("config.dap").setup()
  end,
}

	-- color related stuff
	use 'tanvirtin/monokai.nvim'
	use "norcalli/nvim-colorizer.lua" -- sets colors on hex, f.eks. #90FF11
	use 'navarasu/onedark.nvim'

	-- mappings
	use "svermeulen/vimpeccable"

	-- lang stuff
  use "nvim-treesitter/nvim-treesitter"
	use "neovim/nvim-lspconfig"
	use {
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
		}
	}
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
	use "onsails/lspkind-nvim"
	use "sbdchd/neoformat"
	use "nvim-lua/plenary.nvim"
	use "williamboman/nvim-lsp-installer"
  use {
    "ray-x/lsp_signature.nvim",
  }

	use "lewis6991/gitsigns.nvim"
	use "akinsho/nvim-bufferline.lua"
	use "glepnir/galaxyline.nvim"
	use "windwp/nvim-autopairs"
	use "alvan/vim-closetag"
	-- use "lukas-reineke/indent-blankline.nvim"

	-- Comment
	use "terrortylor/nvim-comment"
  -- Lua
  use {'folke/which-key.nvim'}


	-- file managing , picker etc
	use "kyazdani42/nvim-web-devicons"
	use { 'nvim-telescope/telescope.nvim',
  	  requires = {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-symbols.nvim', 'nvim-telescope/telescope-file-browser.nvim'}
	}
	use "nvim-telescope/telescope-media-files.nvim"
	use "nvim-lua/popup.nvim"
	use {"folke/trouble.nvim",
  	  requires = "kyazdani42/nvim-web-devicons",
  	  config = function()
  	  require("trouble").setup {}
        end}
	use "tpope/vim-fugitive"
	use {'kristijanhusak/orgmode.nvim',
      requires = {"akinsho/org-bullets.nvim"}
    }

-- misc
use "tweekmonster/startuptime.vim"
use "907th/vim-auto-save"
use "karb94/neoscroll.nvim"
end)
