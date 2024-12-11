return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    highlight = {
      backdrop = true,
      matches = true,
      priority = 5000,
      groups = {
        current = "PreProc",
        match = "Function",
        label = "Constant",
        --backdrop = "FlashBackdrop",
      },
    },
    modes = {
      char = {
        enabled = false,
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "<c-s>", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
