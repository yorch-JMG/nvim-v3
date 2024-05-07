vim.g.mapleader = " "
vim.keymap.set("n", "<leader>n", "<Esc>:Neotree toggle<cr>", { silent = true })

vim.keymap.set("n", "<C-s>", "<Esc>:w<cr>")
vim.keymap.set("n", "<C-q>", "<Esc>:q!<cr>")

-- make keybindings to move between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set('i', 'jh', '<Esc>', { noremap = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<leader>gs', '<Esc>:G<cr>')
vim.keymap.set('n', '<leader>gc', '<Esc>:G commit<cr>')
vim.keymap.set('n', '<leader>gp', '<Esc>:G push<cr>')
vim.keymap.set('n', '<leader>gl', '<Esc>:G pull<cr>')
vim.keymap.set('n', '<leader>gst', '<Esc>:G stash<cr>')
