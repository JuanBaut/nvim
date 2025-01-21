return {
  "ThePrimeagen/harpoon",
  lazy = false,
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    local toggle_opts = {
      title_pos = "center",
      ui_width_ratio = 0.40,
    }

    vim.keymap.set("n", "M", function()
      harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts)
    end)
    vim.keymap.set("n", "ma", function()
      harpoon:list():add()
    end)

    for i = 1, 5 do
      vim.keymap.set("n", "m" .. i, function()
        harpoon:list():select(i)
      end)
    end
  end,

  init = function()
    require("which-key").add({
      { "M", group = "Harpoon menu" },
      { "m", group = "Harpoon" },
    })
  end,
}
