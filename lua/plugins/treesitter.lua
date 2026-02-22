return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,

  opts = {

    -- Parsers to install
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "c",
      "cpp",
      "odin",
      "bash",
      "json",
      "toml",
      "markdown",
      "markdown_inline",
    },

    -- Install parsers automatically when entering buffer
    auto_install = true,

    -- Syntax highlighting
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },

    -- Better indentation
    indent = {
      enable = true,
    },

    -- Incremental selection
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        node_decremental = "<bs>",
        scope_incremental = "<C-s>",
      },
    },

    -- Textobjects (requires additional plugin below)
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["ap"] = "@parameter.outer",
          ["ip"] = "@parameter.inner",
        },
      },
    },
  },

  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    if vim.treesitter.language and not vim.treesitter.language.ft_to_lang then
      vim.treesitter.language.ft_to_lang = function(ft)
        return ft
      end
    end
  end,
}
