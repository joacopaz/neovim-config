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
    'tpope/vim-fugitive',
    lazy = false,
  },
  'sindrets/diffview.nvim',
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {
        '*', -- Highlight all files, but customize some others.
        css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
        html = { names = false }, -- Disable parsing "names" like Blue or Gray
      }
    end,
    keys = {
      { '<Leader>c', '<cmd>ColorizerToggle<CR>', desc = 'Toggle Colorizer' }, -- Single-key toggle
    },
  },
  {
    'jiaoshijie/undotree',
    ---@module 'undotree.collector'
    ---@type UndoTreeCollector.Opts
    opts = {
      -- your options
    },
    keys = { -- load the plugin only when using it's keybinding:
      { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>", desc = 'Undo Tree' },
    },
  },
}
