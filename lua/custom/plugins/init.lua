return {
  'sindrets/diffview.nvim',
  opts = { git_cmd = { 'git' } },
  require 'custom.plugins.typescript-tools',
  require 'custom.plugins.fugitive',
  require 'custom.plugins.colorizer',
  require 'custom.plugins.undotree',
  require 'custom.plugins.opencode',
}
