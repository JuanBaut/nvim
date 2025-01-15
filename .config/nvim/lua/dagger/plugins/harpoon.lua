return {
  "ThePrimeagen/harpoon",
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

    vim.keymap.set("n", "m1", function()
      harpoon:list():select(1)
    end)
    vim.keymap.set("n", "m2", function()
      harpoon:list():select(2)
    end)
    vim.keymap.set("n", "m3", function()
      harpoon:list():select(3)
    end)
    vim.keymap.set("n", "m4", function()
      harpoon:list():select(4)
    end)

    vim.keymap.set("n", "mp", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "mn", function()
      harpoon:list():next()
    end)
  end,

  init = function()
    require("which-key").add({
      { "M", group = "Harpoon menu" },
      { "m", group = "Harpoon" },
    })
  end,
}
