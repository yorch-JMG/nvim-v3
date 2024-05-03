vim.g.mapleader = " "
vim.keymap.set("n", "<leader>n", "<Esc>:Neotree toggle<cr>", { silent = true })

vim.keymap.set('i', 'jh', '<Esc>')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
