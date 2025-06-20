local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Center on scroll up/down
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)

-- Git status on F12
map('n', '<F12>', ':Telescope git_status<CR>', { desc = 'Show git status', unpack(opts) })

-- Translate lines up/down with shift u/d
map({ 'v', 'n' }, '<S-d>', ':m .+1<CR>', { desc = 'Move line down', unpack(opts) })
map({ 'v', 'n' }, '<S-u>', ':m .-2<CR>', { desc = 'Move line up', unpack(opts) })

-- Move in insert mode without arrow keys with C-h and C-l
map('i', '<C-h>', '<Left>', { desc = 'Move left', unpack(opts) })
map('i', '<C-l>', '<Right>', { desc = 'Move right', unpack(opts) })

-- Close buffer without closing window
map('n', '<C-c>', function()
  local current_buffer = vim.api.nvim_get_current_buf()
  local buffer_count = #vim.api.nvim_list_bufs()
  if buffer_count > 1 then
    vim.cmd 'bnext'
    vim.api.nvim_buf_delete(current_buffer, { force = false })
  else
    vim.cmd 'enew' -- Open a new empty buffer if no other buffers exist
    vim.api.nvim_buf_delete(current_buffer, { force = false })
  end
end, { desc = 'Close current buffer without closing window', unpack(opts) })

-- LSP utils
map('n', 'gro', ':TSToolsOrganizeImports<CR>', { desc = 'Organize imports (LSP)', unpack(opts) })
map('n', 'grf', ':LspEslintFixAll<CR>', { desc = 'Autofix all (eslint)', unpack(opts) })

-- Quick fix list navigation
map('n', '<A-j>', ':cnext<CR>', { desc = 'Next item in quick fix list', unpack(opts) })
map('n', '<A-k>', ':cprevious<CR>', { desc = 'Previous item in quick fix list', unpack(opts) })
