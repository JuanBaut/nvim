return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  --dependencies = {
  --  "nvim-treesitter/nvim-treesitter-textobjects",
  --},
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      ensure_installed = {
        "jsonc",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "svelte",

        "gitignore",
        "query",

        "markdown",
        "markdown_inline",

        "dockerfile",
        "yaml",
        "toml",

        "bash",
        "python",

        "vim",
        "vimdoc",

        "luadoc",
        "lua",
        "zig",
        "go",
      },
    })
  end,
}
