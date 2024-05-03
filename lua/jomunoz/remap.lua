vim.g.mapleader = " "
vim.keymap.set("n", "<leader>n", "<Esc>:Neotree toggle<cr>", { silent = true })

vim.keymap.set("n", "<C-s>", "<Esc>:w<cr>")
vim.keymap.set("n", "<C-q>", "<Esc>:q!<cr>")

vim.keymap.set('i', 'jh', '<Esc>')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<leader>gs', '<Esc>:G<cr>')
vim.keymap.set('n', '<leader>gc', '<Esc>:G commit<cr>')
