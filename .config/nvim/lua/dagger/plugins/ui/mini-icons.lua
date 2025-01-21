return {
  "echasnovski/mini.icons",
  opts = {},
  specs = {
    { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
  },
  init = function()
    package.preload["nvim-web-devicons"] = function()
      require("mini.icons").mock_nvim_web_devicons()
      return package.loaded["nvim-web-devicons"]
    end
  end,
  config = function()
    require("mini.icons").setup({
      file = {
        ["LICENSE"] = { glyph = "󰿃" },
      },
      filetype = {
        json = { glyph = "" },
        jsonc = { glyph = "" },

        sh = { glyph = "󰐣", hl = "MiniIconsBlue" },
        zsh = { glyph = "󰐣" },
        bash = { glyph = "󰐣" },

        gomod = { glyph = "" },
        gosum = { glyph = "" },
      },
      extension = {
        conf = { glyph = "󰛸", hl = "MiniIconsBlue" },
        go = { glyph = "" },
      },
    })
  end,
}
