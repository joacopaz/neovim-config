local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Center cursor when scrolling up or down in page
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)
map('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })

-- Set terminal
vim.opt.shell = '"C:\\Program Files\\Git\\bin\\bash.exe"'
vim.opt.shellcmdflag = '-c'
vim.opt.shellquote = ''
vim.opt.shellxquote = ''

-- Reload last session on load
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    if vim.fn.argc() == 0 then
      require('persistence').load()
    end
  end,
})
