-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {

    'pmizio/typescript-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
    },
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    opts = {
      settings = {
        separate_diagnostic_server = true,
        publish_diagnostic_on = 'insert_leave',
        expose_as_code_action = 'all',
        tsserver_file_preferences = {
          includeInlayParameterNameHints = 'all',
          includeCompletionsForModuleExports = true,
        },
        tsserver_logs = 'verbose',
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
        '<leader>rs',
        function()
          require('persistence').load()
        end,
        desc = 'Restore Session',
      },
    },
  },
}
