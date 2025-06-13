-- Custom key maps
require 'custom.config.keymaps'

-- Terminal configuration
require 'custom.config.terminal'

-- Spell checking config
require 'custom.config.spell'

-- Fold config
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false
