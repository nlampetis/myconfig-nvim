return require('packer').startup(function()

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  --icons
  use { 'kyazdani42/nvim-web-devicons' }

  -- onedark theme
  use { 'navarasu/onedark.nvim', as = 'onedark' }

  -- vim airline
  use { 'vim-airline/vim-airline', as = 'airline' }
  use { 'vim-airline/vim-airline-themes', as = 'airline-themes' }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'BurntSushi/ripgrep' }
    }
  }

  -- treesitter highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- blankline indent
  use { 'lukas-reineke/indent-blankline.nvim' }

  -- tagbar
  -- use { 'preservim/tagbar' }
  -- barbar
   use { 'romgrk/barbar.nvim' }

  --startify
  use { 'mhinz/vim-startify' }


  --auto comment uncomment
  use { "preservim/nerdcommenter", as = "nerdcommenter" }


  -- mason lsp
  use { "williamboman/mason.nvim" }
  -- mason lsp-config
  use { "williamboman/mason-lspconfig.nvim"}
  -- nvim lsp-config
  use { 'neovim/nvim-lspconfig' }

  -- cmp
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/nvim-cmp' }

  -- luasnips
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'honza/vim-snippets' }
  -- snippets for luasnip import
  use { 'rafamadriz/friendly-snippets' }

-- nvimtree
  use { 'kyazdani42/nvim-tree.lua', as = 'nvimtree' }

-- close parentheses pairs
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

end)
