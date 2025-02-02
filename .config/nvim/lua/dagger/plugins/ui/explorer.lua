return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      -- your explorer configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      replace_netrw = true,
    },
    picker = {
      sources = {
        explorer = {
          auto_close = true,
          layout = { layout = { position = "right" } },
        },
      },
    },

    vim.keymap.set("n", "<leader>fe", "<cmd>lua Snacks.explorer()<CR>", { desc = "File Explorer" }),
  },
}
