return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "erb-lint",
        "htmlbeautifier",
        "css-lsp",
        "html-lsp",
        "nil",
      })
    end,
  },
}
