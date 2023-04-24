local vim = vim
local api = vim.api
local opt = vim.opt
local g = vim.g

local themes = { 'dracula', 'gruvbox', 'onedark', 'nord', 'iceberg' }


-- use theme 1, 2, 3, ...
api.nvim_command([[colorscheme ]] .. themes[3])

--require('plugins.onedark')
--require('onedark').load()

-- vim.cmd("set filetype true")
-- airline globals
g.airline_theme = themes[3]
g.airline_powerline_fonts = 1
vim.cmd("let g:airline#extensions#tabline#enabled = 1")
vim.cmd("let g:airline#extensions#tabline#formatter = 'unique_tail'")

-- vim.cmd("hi Pmenu guibg=none")
-- vim.cmd("hi NormalFloat guibg=none")

opt.confirm = true
opt.laststatus = 3 -- global statusline



opt.title = true
opt.clipboard = "unnamedplus"
opt.cmdheight = 1
opt.cul = true -- cursor line

opt.encoding = "utf-8"
-- Indentline
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true

-- disable eof tilde
opt.fillchars = { eob = " " }

-- font
 --opt.guifont= "3270Narrow NF:h12"
opt.guifont = "Hack NFM:h12"

--
opt.hidden = true
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 8
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"
g.mapleader = ' '



local default_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(default_plugins) do
  g["loaded_" .. plugin] = 1
end
