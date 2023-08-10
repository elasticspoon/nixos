return  {
  {
      "folke/which-key.nvim",
      optional = true,
      opts = {
        defaults = {
          -- custom macros
          ["<leader>z"] = { name = "+custom binds" },
          ["<leader>zb"] = { name = "+blog" },
        },
      },
    },
}
