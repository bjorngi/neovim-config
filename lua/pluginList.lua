local packer = require("packer")
local use = packer.use

return packer.startup(function()
	use "wbthomason/packer.nvim"
  use 'rmagatti/goto-preview'
  use "akinsho/toggleterm.nvim"
  use 'nanotee/sqls.nvim'
  
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use {
     'NeogitOrg/neogit',
      requires = {
       'nvim-lua/plenary.nvim',
       'sindrets/diffview.nvim'
      }
  }

  --- yaml stuff
--  use {
--    "someone-stole-my-name/yaml-companion.nvim",
--    requires = {
--      { "neovim/nvim-lspconfig" },
--      { "nvim-lua/plenary.nvim" },
--      { "nvim-telescope/telescope.nvim" },
--    },
--    config = function()
--      require("telescope").load_extension("yaml_schema")
--    end,
--  }
  -- testing
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
      "marilari88/neotest-vitest"
    }
  }

	-- color related stuff
	use "norcalli/nvim-colorizer.lua" -- sets colors on hex, f.eks. #90FF11
	use 'navarasu/onedark.nvim' -- awesome theme

	-- mappings
  use {'folke/which-key.nvim'}

	-- lang stuff
  use "nvim-treesitter/nvim-treesitter"
	use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

	use {
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip"
		}
	}
	use "onsails/lspkind-nvim"
	use "sbdchd/neoformat"

  use "ray-x/lsp_signature.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use {
    'tanvirtin/vgit.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
	use "akinsho/nvim-bufferline.lua"
	use "glepnir/galaxyline.nvim"
	use "windwp/nvim-autopairs"
	use "kyazdani42/nvim-web-devicons"

	-- file managing , picker etc
	use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-symbols.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-telescope/telescope-media-files.nvim'
    }
	}
	use {"folke/trouble.nvim",
  	  requires = "kyazdani42/nvim-web-devicons",
  	  config = function()
  	  require("trouble").setup {}
        end}

  -- sudo apt-get install sqlite3 libsqlite3-dev
  use {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require"telescope".load_extension("frecency")
    end,
    requires = {"tami5/sqlite.lua"}
  }
-- misc
use "karb94/neoscroll.nvim"

-- ast-grep
use "Marskey/telescope-sg"

-- markdown
use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})
end)
