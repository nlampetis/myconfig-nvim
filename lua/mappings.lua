-- general mappings
vim.api.nvim_set_keymap("n", " ", "<Nop>", {}) -- map nothing to leader key (space)
vim.api.nvim_set_keymap("v", " ", "<Nop>", {}) -- map nothing to leader key (space)
vim.api.nvim_set_keymap("i", "jk", "<esc>", { noremap = true }) -- map jk to esc
vim.api.nvim_set_keymap("n", "<C-l>", ":nohl<cr>", {noremap = true})

vim.api.nvim_set_keymap("n", "<leader>q", ":q<cr>", { noremap = true }) -- safe quit
vim.api.nvim_set_keymap("n", "<leader>wq", ":wq<cr>", { noremap = true }) -- save and quit
vim.api.nvim_set_keymap("n", "<leader>ww", ":wqa<cr>", { noremap = true }) -- save and quit all

-- buffers
vim.api.nvim_set_keymap("n", "<leader><tab>", ":bn<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>1", "<C-^>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>bb", ":bd<cr>", { noremap = true })


-- split windows
vim.api.nvim_set_keymap("n", "<leader>s", ":split<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>v", ":vsplit<cr>", { noremap = true })
-- -- navigation
vim.api.nvim_set_keymap("n", "<A-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-l>", "<C-w>l", { noremap = true })


-- nvimtree keymaps
vim.api.nvim_set_keymap("n", "<F2>", ":NvimTreeToggle<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>r", ":NvimTreeRefresh<cr>", { noremap = true })

-- telescope maps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fd', builtin.fd, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
