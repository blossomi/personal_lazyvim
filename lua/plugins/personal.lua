---@diagnostic disable: undefined-global
return {
  --------------------------------------- cmp ---------------------------------------
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts

    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },

    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},

        -------------------------------------------- rust_analyzer -----------------------------------
        rust_analyzer = {
          -- on_attach
          on_attach = function(client, bufnr)
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end,

          settings = {
            ["rust-analyzer"] = {
              checkOnSave = { command = "clippy" },
              cargo = { allFeatures = true },
              inlayHints = {
                bindingModeHints = { enable = true },
                closureReturnTypeHints = { enable = true },
                lifetimeElisionHints = { enable = true },
                reborrowHints = { enable = true },
              },
            },
          },
        },

        ---------------------------------------- TypeScrupt LSP Config -----------------------
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = {},
      },

      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },
  ------------------------------------- harpoon2 ----------------------------------
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    settings = {
      save_on_toggle = ture,
      sync_on_ui_close = true,
      key = function()
        return vim.loop.cwd()
      end,
    },
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
    config = function()
      require("telescope").load_extension("hardhat")
    end,
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

  --------------------------------------- neotest ----------------------------
  {
    "nvim-neotest/neotest",
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-hardhat"),
        },
      })
    end,

    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },

  --------------------------------------- tree----------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "typescript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "vim",
        "yaml",
        "rust",
        "solidity",
      },
    },
  },
}
