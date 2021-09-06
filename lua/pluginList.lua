local packer = require("packer")
local use = packer.use

-- using { } for using different branch , loading plugin with certain commands etc
return packer.startup(
function()
	use "wbthomason/packer.nvim"


	-- color related stuff
	use 'tanvirtin/monokai.nvim'
	use "norcalli/nvim-colorizer.lua" -- sets colors on hex #90FF11
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
	use "kabouzeid/nvim-lspinstall"

	use "lewis6991/gitsigns.nvim"
	use "akinsho/nvim-bufferline.lua"
	use "glepnir/galaxyline.nvim"
	use "windwp/nvim-autopairs"
	use "alvan/vim-closetag"
	-- use "lukas-reineke/indent-blankline.nvim"

	-- Comment
	use "terrortylor/nvim-comment"

	-- snippet support
	-- use "hrsh7th/vim-vsnip"
	-- use "rafamadriz/friendly-snippets"

	-- file managing , picker etc
	use "kyazdani42/nvim-web-devicons"
	use "nvim-telescope/telescope.nvim"
	use { 'nvim-telescope/telescope.nvim',
  	  requires = { {'nvim-lua/plenary.nvim'} }
	}
	use "nvim-telescope/telescope-media-files.nvim"
	use "nvim-lua/popup.nvim"
	use {"folke/trouble.nvim",
  	  requires = "kyazdani42/nvim-web-devicons",
  	  config = function()
  	  require("trouble").setup {}
        end}
	use "tpope/vim-fugitive"
	use {'kristijanhusak/orgmode.nvim', branch = 'tree-sitter', config = function()
	  require('orgmode').setup{}
	end
	}

-- misc
use "tweekmonster/startuptime.vim"
use "907th/vim-auto-save"
use "karb94/neoscroll.nvim"
end)
