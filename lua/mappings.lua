-- general mappings
vim.api.nvim_set_keymap("n", "<space>", "<nop>", {noremap = true}) -- map nothing to leader key (space)
vim.api.nvim_set_keymap("i", "jk", "<esc>", {noremap = true}) -- map jk to esc

vim.api.nvim_set_keymap("n", "<leader>q", ":q<cr>", {noremap = true}) -- safe quit
vim.api.nvim_set_keymap("n", "<leader>wq", ":wq<cr>", {noremap = true}) -- save and quit

-- buffers
vim.api.nvim_set_keymap("n", "<leader><tab>", ":bn<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>1", "<C-^>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>bb", ":bd<cr>", {noremap = true})


-- split windows
vim.api.nvim_set_keymap("n", "<leader>s", ":split<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>v", ":vsplit<cr>", {noremap = true})
-- -- navigation
vim.api.nvim_set_keymap("n", "<leader>k", "<C-w>k", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>j", "<C-w>j", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>h", "<C-w>h", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>l", "<C-w>l", {noremap = true})



-- nvimtree keymaps
vim.api.nvim_set_keymap("n", "<F2>", ":NvimTreeToggle<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>r", ":NvimTreeRefresh<cr>", {noremap = true})
