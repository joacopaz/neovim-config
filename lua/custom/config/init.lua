local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Center cursor when scrolling up or down in page
map('n', '<C-d>', '<C-d>zz', opts)

map('n', '<C-u>', '<C-u>zz', opts)

map({ 'n', 't', 'v', 'i' }, '<C-F4>', ':bd<CR>', { desc = 'Close current buffer', unpack(opts) })

map('n', '<F12>', ':Telescope git_status<CR>', { desc = 'Show git status', unpack(opts) })

map({ 'v', 'n' }, '<S-d>', ':m .+1<CR>', { desc = 'Move line down', unpack(opts) })

map({ 'v', 'n' }, '<S-u>', ':m .-2<CR>', { desc = 'Move line up', unpack(opts) })

map('i', '<C-h>', '<Left>', { desc = 'Move left', unpack(opts) })

map('i', '<C-l>', '<Right>', { desc = 'Move right', unpack(opts) })

-- Terminal configuration
require 'custom.config.terminal'

-- Dictionary
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
