local plugins = {
  -- Core
  { import = 'plugins.core.lsp' },
  { import = 'plugins.core.treesitter' },

  -- Editing
  { import = 'plugins.editing.comment' },
  { import = 'plugins.editing.completion' },
  { import = 'plugins.editing.conform' },
  { import = 'plugins.editing.git' },
  { import = 'plugins.editing.lint' },
  { import = 'plugins.editing.windsurf' },

  -- Navigation
  { import = 'plugins.navigation.telescope' },
  { import = 'plugins.navigation.neotree' },

  -- UI
  { import = 'plugins.ui.colorsheme' },
  { import = 'plugins.ui.highlight-colors' },
  { import = 'plugins.ui.statusline' },

  -- Misc
  { import = 'plugins.misc.wakatime' },
}

return plugins
