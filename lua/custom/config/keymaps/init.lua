local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local all_keys = { 'n', 'v', 'i' }

-- Center on scroll up/down
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)

-- Git status on F12
map('n', '<F12>', ':Telescope git_status<CR>', { desc = 'Show git status', unpack(opts) })

-- Translate lines up/down with shift u/d
map({ 'v', 'n' }, '<S-d>', ':m .+1<CR>', { desc = 'Move line down', unpack(opts) })
map({ 'v', 'n' }, '<S-u>', ':m .-2<CR>', { desc = 'Move line up', unpack(opts) })

-- Select all binding
map({ 'v', 'n' }, '<C-a>', 'ggVGzz', { desc = 'Select All', unpack(opts) })

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
map('n', '<leader>rt', function()
  local bufnr = vim.api.nvim_get_current_buf()
  for _, client in ipairs(vim.lsp.get_active_clients { bufnr = bufnr }) do
    if client.name == 'typescript-tools' then
      vim.lsp.stop_client(client.id) -- stop typescript-tools
    end
  end

  vim.defer_fn(function()
    vim.cmd 'edit' -- reloads buffer
    vim.notify('Restarted typescript-tools for current buffer', vim.log.levels.INFO)
  end, 100)
end, { desc = 'Restart TypeScript server', unpack(opts) })

-- Quick fix list navigation
map('n', '<A-j>', ':cnext<CR>', { desc = 'Next item in quick fix list', unpack(opts) })
map('n', '<A-k>', ':cprevious<CR>', { desc = 'Previous item in quick fix list', unpack(opts) })

-- Toggle relative line numbers
map('n', '<leader>rl', function()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
  else
    vim.wo.relativenumber = true
  end
end, { desc = 'Toggle relative line numbers', unpack(opts) })

map('n', '<C-w><C-r>', function()
  local size = vim.fn.input 'New width: '
  if tonumber(size) then
    vim.cmd('vertical resize ' .. size)
  else
    print 'Invalid number'
  end
end, { desc = 'Resize window width', unpack(opts) })

-- Navigate tabs
map(all_keys, '[t', ':tabprev<CR>', { desc = 'Previous Tab', unpack(opts) })
map(all_keys, ']t', ':tabnext<CR>', { desc = 'Next Tab', unpack(opts) })
