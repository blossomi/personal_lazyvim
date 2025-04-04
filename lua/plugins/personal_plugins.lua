return {
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    config = function()
      require("harpoon").setup({
        global_settings = {
          save_on_toggle = true,
          save_on_change = true,
          enter_on_sendcmd = false,
          mark_branch = false,
        },
      })
    end,
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  ---------------------------------------- crates ------------------------------

  {
    "saecki/crates.nvim",
    tag = "stable",
    config = function()
      require("crates").setup()
    end,
  },

  ---------------------------------------- telescope ------------------------------
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    },
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

  ---------------------------------------- neo tree------------------------------
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
      popup_border_style = "rounded", -- "double", "rounded", "solid", "none"
      enable_git_status = true, -- false by default
    },
  },
}
