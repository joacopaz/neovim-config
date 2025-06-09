return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {
      settings = {
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
}
