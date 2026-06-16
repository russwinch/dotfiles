return {
  {
    "tpope/vim-fugitive",
    lazy = false,
    cond = not vim.g.vscode, -- Disable in vscode-neovim due to duplicate hunk bug
  },
  { "tpope/vim-rhubarb" }, -- open git in browser
  {
    "greggh/claude-code.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for git operations
    },
    config = function()
      require("claude-code").setup()
    end,
  },
  {
    "machakann/vim-highlightedyank",
    lazy = false,
    config = function()
      -- Configure highlightedyank
      vim.g.highlightedyank_highlight_duration = 150
    end,
  },
  { "editorconfig/editorconfig-vim", lazy = false },
  -- all below plugins dont work well with vscode-neovim so are conditionally disabled :(
  {
    "stevearc/conform.nvim",
    cond = not vim.g.vscode,
    event = "BufWritePre",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    cond = not vim.g.vscode,
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    cond = not vim.g.vscode,
    config = function()
      local dap = require "dap"
      dap.adapters.python = {
        type = "executable",
        command = "python",
        args = { "-m", "debugpy.adapter" },
      }
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}", -- This will launch the current file
          pythonPath = function()
            return "python"
          end,
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    cond = not vim.g.vscode,
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
      },
    },
  },
  {
    "nvim-neotest/neotest",
    cond = not vim.g.vscode,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
    },
  },
  {
    "dyng/ctrlsf.vim",
    cond = not vim.g.vscode,
    lazy = false,
  },
  { "tpope/vim-dispatch", cond = not vim.g.vscode },
  { "tpope/vim-surround", cond = not vim.g.vscode, lazy = false },
  { "tpope/vim-repeat", cond = not vim.g.vscode, lazy = false },
  { "tpope/vim-unimpaired", cond = not vim.g.vscode },
  { "tpope/vim-speeddating", cond = not vim.g.vscode },
  { "tpope/vim-projectionist", cond = not vim.g.vscode },
  { "tpope/vim-vinegar", cond = not vim.g.vscode },
  { "tpope/vim-abolish", cond = not vim.g.vscode },
}

-- Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
-- Plug 'ervandew/supertab'
-- 'sindrets/diffview.nvim'},
-- " Plug 'vim-python/python-syntax', {'for': 'python'}
-- 'nvim-telescope/telescope-live-grep-args.nvim'},
-- " Plug 'bhurlow/vim-parinfer', {'for': 'clojure'}
-- " Plug 'ludovicchabant/vim-gutentags'
-- Plug 'christoomey/vim-sort-motion'},
-- " Plug 'alfredodeza/pytest.vim', {'for': 'python'}
-- Plug 'vim-test/vim-test'
-- Plug 'tpope/vim-commentary'
-- Plug 'davidhalter/jedi-vim'
-- Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
-- Plug 'deoplete-plugins/deoplete-jedi', {'for': 'python'}
-- Plug 'itchyny/lightline.vim'
-- Plug 'w0rp/ale'
-- Plug '/usr/local/opt/fzf'
-- Plug 'junegunn/fzf'
-- Plug 'junegunn/fzf.vim'
-- Plug 'tpope/vim-fireplace', {'for': 'clojure'}
-- Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure'}
-- Plug 'guns/vim-sexp', {'for': 'clojure'}
-- Plug 'junegunn/rainbow_parentheses.vim', {'for': 'clojure'}
-- Plug 'tmhedberg/SimpylFold', {'for': 'python'}
