return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- dracula theme
	use {'dracula/vim', as ='dracula'}

        --icons
        use {'kyazdani42/nvim-web-devicons'}

        -- gruvbox theme
        use {'morhetz/gruvbox', as='gruvbox'}
        
        -- onedark theme
        use {'navarasu/onedark.nvim', as='onedark'}

        -- vim airline
        use {'vim-airline/vim-airline', as ='airline'}
        use {'vim-airline/vim-airline-themes', as = 'airline-themes'}

        -- nvimtree
        use {'kyazdani42/nvim-tree.lua',as='nvimtree'}

        -- telescope
        use {
          'nvim-telescope/telescope.nvim',
          requires = { {'nvim-lua/plenary.nvim'} }
        }

        -- which key
        use {"folke/which-key.nvim", as = 'whichkey',
        config = function()
           require("which-key").setup {
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
           }
          end
        }

        -- git
        use {'tpope/vim-fugitive'}

        -- lsp
        use {'neovim/nvim-lspconfig'}

        -- cmp
        use {'hrsh7th/cmp-nvim-lsp'}
        use {'hrsh7th/cmp-buffer'}
        use {'hrsh7th/cmp-path'}
        use {'hrsh7th/cmp-cmdline'}
        use {'hrsh7th/nvim-cmp'}
        -- with luasnip
        use {'L3MON4D3/LuaSnip'}
        use {'saadparwaiz1/cmp_luasnip'}
        -- snippets for luasnip import
        use {'rafamadriz/friendly-snippets'}

        -- cmp customization
        use {'onsails/lspkind.nvim'}

        -- treesitter highlighting
        use {
                'nvim-treesitter/nvim-treesitter',
                run = ':TSUpdate'
            }

        -- blankline indent
        use {'lukas-reineke/indent-blankline.nvim'}

        -- tagbar
        use {'preservim/tagbar'}

        -- barbar
        use {'romgrk/barbar.nvim'}

        --startify
        use {'mhinz/vim-startify'}

        -- lsp install
        use {
            "williamboman/nvim-lsp-installer",
        }

        -- clang-tidy for lsp
        use{
          "emilienlemaire/clang-tidy.nvim"
        }

        --auto comment uncomment
        use { "preservim/nerdcommenter", as = "nerdcommenter"}


        -- folding and unfolding of code blocks
        use{ 'anuvyklack/pretty-fold.nvim',
          requires = 'anuvyklack/nvim-keymap-amend', -- only for preview
          config = function()
            require('pretty-fold').setup()
            require('pretty-fold.preview').setup()
          end
        }

        -- auto doc generator
        use {
            'kkoomen/vim-doge',
            run = ':call doge#install()',
            config = function()
              vim.g.doge_doc_standard_python = 'google'
            end,
          }

        -- close parentheses pairs
        use {"jiangmiao/auto-pairs"}
end)

