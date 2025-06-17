---@type LazySpec
return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {
      expose_as_code_action = 'all',
      complete_function_calls = false,
      jsx_close_tag = { enable = true, filetypes = { 'javascriptreact', 'typescriptreact' } },
      settings = {
        tsserver_plugins = {
          '@styled/typescript-styled-plugin',
        },
        separate_diagnostic_server = true,
        publish_diagnostic_on = 'insert_leave',
        expose_as_code_action = 'all',
        tsserver_file_preferences = {
          includeInlayParameterNameHints = 'all',
          includeCompletionsForModuleExports = true,
        },
      },
    },
  },
  {
    'folke/persistence.nvim',
    event = 'BufReadPre', -- load before opening files
    opts = {
      options = { 'buffers', 'curdir', 'tabpages', 'winsize' },
    },
    keys = {
      {
        '<leader>rr',
        function()
          require('persistence').load()
        end,
        desc = 'Restore Session',
      },
    },
  },
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'G', 'Gdiffsplit', 'Gvdiffsplit', 'Gedit' }, -- lazy load
    keys = {
      { '<leader>g', '<cmd>Git<CR>', desc = 'Git status (Fugitive)' },
    },
  },
  'sindrets/diffview.nvim',
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {
        filetypes = { '*' }, -- Apply to all filetypes
        user_default_options = {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          names = true, -- Color names (e.g., "blue")
          mode = 'background', -- Display mode
        },
      }
    end,
    keys = {
      { '<Leader>c', '<cmd>ColorizerToggle<CR>', desc = 'Toggle Colorizer' }, -- Single-key toggle
    },
  },
}
