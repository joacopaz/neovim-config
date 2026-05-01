-- Fold
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false

-- Spell
vim.opt.spelllang = 'en_us'
vim.opt.spell = false
vim.opt.spelloptions = 'camel'

-- Python provider: dedicated venv with pynvim installed
vim.g.python3_host_prog = vim.fn.expand '~/.venvs/nvim/bin/python3'

-- Disable unused language providers to silence checkhealth warnings
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
