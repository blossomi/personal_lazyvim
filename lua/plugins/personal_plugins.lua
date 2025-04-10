return {
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    config = function()
      require("harpoon").setup({})
    end,
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  ---------------------------------------- crates ------------------------------

  {
    "saecki/crates.nvim",
    tag = "stable",
  },

  ---------------------------------------- telescope ------------------------------
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  ---------------------------------------- hardhat ------------------------------
  {
    "TheSnakeWitcher/hardhat.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neotest/neotest",
      "nvim-telescope/telescope.nvim",
      "stevearc/overseer.nvim",
    },
  },
}
