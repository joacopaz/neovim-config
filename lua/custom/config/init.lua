local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Center cursor when scrolling up or down in page
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)
map('t', '<C-Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
map({ 'n', 't', 'v', 'i' }, '<C-F4>', ':bd<CR>', { desc = 'Close current buffer' })

-- Terminal configuration
require 'custom.config.terminal'
