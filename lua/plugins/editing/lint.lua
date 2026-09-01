return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost", "InsertLeave" },
  opts = {
    linters_by_ft = {
      lua = { "luacheck" },
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      python = { "pylint" },
      sh = { "shellcheck" },
    },
  },
  config = function(_, opts)
    local lint = require("lint")

    lint.linters_by_ft = opts.linters_by_ft

    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
