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
                    vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports",
                        { buffer = buffer, desc = "Organize Imports" })
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
      save_on_toggle = true,
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
      -- "nvim-telescope/telescope.nvim",
      "stevearc/overseer.nvim",
    },
  },

  --------------------------------------- neotest ----------------------------
  {
    "nvim-neotest/neotest",
    config = function()
      require("neotest").setup({
        adapters = {
          require("rustaceanvim.neotest"),
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

  --------------------------------------- nvim-treesitter ----------------------------
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
  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
  },

  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.ai").setup({}) -- Activates comment functional
      require("mini.comment").setup({}) -- Activates comment functional
      require("mini.surround").setup({}) -- Enables surround operations     -- Add individual module configurations here
      require("mini.move").setup({})
      -- require("animate").setup({})
      -- require("icons").setup({})
      -- require("hues").setup({})
    end,
  },

  ----------------------------------------- conform -------------------------------------

  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
    },
    formatters = {
      prettier = {
        prepend_args = {
          "--tab-width",
          "4",
          "--print-width",
          "120",
        },
      },
    },
  },
  ----------------------------------------- gitsigns -----------------------------------------
  -- ~/.config/nvim/lua/plugins/gitsigns-custom.lua
  {
    "lewis6991/gitsigns.nvim", -- 确保插件名与 LazyVim 中定义的一致
    opts = function(_, opts) -- 使用 opts 函数来合并或覆盖默认配置
      -- opts 参数包含了 LazyVim 为 gitsigns 设置的默认选项
      -- 你可以在这里修改或添加新的选项

      -- 启用或自定义当前行 blame 信息
      opts.current_line_blame = true
      opts.current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 显示在行尾
        delay = 500, -- 延迟 500ms 显示
        -- ignore_whitespace = false,
      }
      -- 自定义 blame 信息的显示格式
      opts.current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> • <summary>"
      -- 你也可以设置高亮
      opts.current_line_blame_formatter_hl = "Todo"

      return opts -- 必须返回修改后的 opts 表
    end,
  },
  ----------------------------------------- augment -------------------------------------------
  -- { "augmentcode/augment.vim" },
}
