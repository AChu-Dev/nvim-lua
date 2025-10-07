local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

vim.keymap.set("n", "<C-e", ":Lex 30<cr>", opts)
vim.keymap.set("n", "<S-Left>", ":bprevious<cr>", opts)
vim.keymap.set("n", "<S-Right>", ":bnext<cr>", opts)
vim.keymap.set("n", "<C-Left>", ":tabprevious<cr>", opts)
vim.keymap.set("n", "<C-Right>", ":tabnext<cr>", opts)
vim.keymap.set("n", "<C-h>", ":tabprevious<cr>", opts)
vim.keymap.set("n", "<C-l>", ":tabnext<cr>", opts)
