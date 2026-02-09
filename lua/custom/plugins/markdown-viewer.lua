-- The plugin should be loaded after your colorscheme to ensure the correct highlight groups are used. See integrations.transparent_colorschemes if you use a transparent colorscheme and the colors don't look right.

return {
  'OXY2DEV/markview.nvim',
  lazy = false,

  -- Completion for `blink.cmp`
  dependencies = { 'saghen/blink.cmp' },

  keys = {
    { '<leader>m', '<CMD>Markview<CR>', desc = 'Toggles markview previews globally' },
  },
}
