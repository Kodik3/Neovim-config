local KEYS = {
  { "<C-g>", function() return vim.fn["codeium#Accept"]() end, mode = "i", expr = true, desc = "Codeium Accept" },
  { "<C-;>", function() return vim.fn  end, mode = "i", expr = true, desc = "Codeium Next Suggestion" },
  { "<C-,>", function() return vim.fn["codeium#CycleCompletions"](-1) end, mode = "i", expr = true, desc = "Codeium Prev Suggestion" },
  { "<C-x>", function() return vim.fn["codeium#Clear"]() end, mode = "i", expr = true, desc = "Codeium Clear Suggestion" },
}

return {
  'Exafunction/windsurf.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
  },

  config = function()
    require("codeium").setup({
      enable_chat = false,
      enable_local_search = false,
      enable_index_service = false,
      keys = KEYS,
    })
  end,
}