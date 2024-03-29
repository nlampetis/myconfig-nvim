return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- dracula theme
  use { 'dracula/vim', as = 'dracula' }

  -- iceberg
  use { 'cocopon/iceberg.vim' , as = 'iceberg' } 

  -- nord
  use { 'arcticicestudio/nord-vim' , as = 'nord' } 

  --icons
  use { 'kyazdani42/nvim-web-devicons' }

  -- gruvbox theme
  use { 'morhetz/gruvbox', as = 'gruvbox' }

  -- onedark theme
  use { 'navarasu/onedark.nvim', as = 'onedark' }

  -- vim airline
  use { 'vim-airline/vim-airline', as = 'airline' }
  use { 'vim-airline/vim-airline-themes', as = 'airline-themes' }

  -- nvimtree
  use { 'kyazdani42/nvim-tree.lua', as = 'nvimtree' }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'BurntSushi/ripgrep' }
    }

  }

  -- which key
  use { "folke/which-key.nvim", as = 'whichkey',
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- git
  use { 'tpope/vim-fugitive' }

  -- lsp
  use { 'neovim/nvim-lspconfig' }

  -- cmp
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/nvim-cmp' }
  -- with luasnip
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'honza/vim-snippets' }
  -- snippets for luasnip import
  use { 'rafamadriz/friendly-snippets' }

  -- cmp customization
  use { 'onsails/lspkind.nvim' }

  -- treesitter highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    --highlight ={
      --disable = {"html"},
    --}
  }

  -- blankline indent
  use { 'lukas-reineke/indent-blankline.nvim' }

  -- tagbar
  use { 'preservim/tagbar' }

  -- barbar
  use { 'romgrk/barbar.nvim' }

  --startify
  use { 'mhinz/vim-startify' }

  --session manager
  --use {'Shatur/neovim-session-manager'}

  -- lsp install
  use {
    "williamboman/nvim-lsp-installer",
  }

  -- clang-tidy for lsp
  use {
    "emilienlemaire/clang-tidy.nvim"
  }

  --auto comment uncomment
  use { "preservim/nerdcommenter", as = "nerdcommenter" }


  -- folding and unfolding of code blocks
  use { 'anuvyklack/pretty-fold.nvim',
    --requires = 'anuvyklack/nvim-keymap-amend', -- only for preview
    config = function()
      require('pretty-fold').setup()
      --require('pretty-fold.preview').setup()
    end
  }

  --[[        -- auto doc generator]]
  --[[use {]]
  --[['kkoomen/vim-doge',]]
  --[[run = ':call doge#install()',]]
  --[[config = function()]]
  --[[vim.g.doge_doc_standard_python = 'google']]
  --[[end,]]
  --[[}]]

  -- close parentheses pairs
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }


  -- documentation generator
  use {
    "danymat/neogen",
    config = function()
      require('neogen').setup {}
    end,
    requires = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    -- tag = "*"
  }

  use {'mfussenegger/nvim-jdtls'}

  use {'mfussenegger/nvim-dap'}


end)
