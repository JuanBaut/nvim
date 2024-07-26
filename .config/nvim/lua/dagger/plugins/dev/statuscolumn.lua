return {
  dir = "~/dev/neovim/statuscolumn.nvim",
  event = { "BufReadPre", "BufNewFile" },
  enabled = true,
  lazy = false,
  config = function()
    require("statuscolumn").setup({
      enable_border = true,
      gradient_hl = "PreProc",
    })
  end,
}
