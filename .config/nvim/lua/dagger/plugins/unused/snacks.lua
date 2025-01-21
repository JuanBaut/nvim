return {
  "folke/snacks.nvim",
  event = { "BufReadPre", "BufNewFile" },
  enabled = true,
  opts = {
    indent = {
      indent = {
        enabled = false,
      },
      scope = {
        only_current = true,
        underline = true,
        char = "▏",
      },
      animate = {
        enabled = false,
      },
    },
  },
}
