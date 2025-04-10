return {
  { "shaunsingh/nord.nvim" },

  { "olimorris/onedarkpro.nvim" },

  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
