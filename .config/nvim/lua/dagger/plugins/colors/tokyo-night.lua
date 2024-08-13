return {
  "folke/tokyonight.nvim",
  --enabled = false,
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      transparent = false,
      dim_inactive = true,
      on_colors = function(colors)
        colors.bg = "#0D1017"
        colors.bg_dark = "#0D1017"
        colors.bg_float = "#131621"
        colors.bg_popup = "#131621"
        colors.bg_search = "#131621"
        colors.bg_sidebar = "#131621"
        colors.bg_statusline = "#131621"
      end,
    })
    vim.cmd.colorscheme("tokyonight-moon")
  end,
}
