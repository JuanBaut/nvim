return {
  "aileot/ex-colors.nvim",
  enabled = false,
  lazy = true,
  cmd = "ExColors",
  init = function()
    require("ex-colors").setup({
      colors_dir = vim.fn.stdpath("config") .. "/lua/dagger/core",
    })
  end,
}
