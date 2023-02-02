-- basic packer package file
require("packerinit")

-- basic options file
require("options")

-- general mappings file
require("mappings")

-- -- plugins config files
-- lsp
require('plugins.lsp')
require('plugins.cmp')
require('plugins.treesitter')
require('plugins.luasnip')

-- ui
require('plugins.nvimtree')
require('plugins.telescope')
require('plugins.icons')
require('plugins.blankline')
require('plugins.onedark')
require('plugins.barbar')

