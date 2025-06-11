vim.opt.spelllang = 'en_us'
vim.opt.spell = true
vim.opt.spelloptions = 'camel'

vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    vim.cmd 'syn spell toplevel'
  end,
})

local langs = {
  'bash',
  'lua',
  'vim',
  'vimdoc',
  'query',
  'c',
  'c_sharp',
  'git_rebase',
  'gitcommit',
  'gitignore',
  'go',
  'json',
  'sql',
  'terraform',
  'toml',
  'typescript',
}

local function add_queries()
  local base_dir = vim.fn.stdpath 'config' .. '/after/queries/'
  local query_template = '; inherits: %s\n\n(identifier) @spell\n'

  for _, lang in ipairs(langs) do
    local dir = base_dir .. lang
    local path = dir .. '/highlights.scm'

    -- Skip if file already exists
    if vim.fn.filereadable(path) == 1 then
      goto continue
    end

    -- Create directory if needed
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end

    -- Write the query file
    local ok, err = pcall(function()
      local file = assert(io.open(path, 'w'))
      file:write(string.format(query_template, lang))
      file:close()
    end)

    if not ok then
      vim.notify('Failed to write query for ' .. lang .. ': ' .. err, vim.log.levels.WARN)
    end

    ::continue::
  end
end

-- Run after startup
vim.defer_fn(add_queries, 0)
