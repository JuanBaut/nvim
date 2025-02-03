local lint_progress = function()
  local linters = require("lint").get_running()
  if #linters == 0 then
    return ""
  end
  return " " .. table.concat(linters, ", ")
end

local harpoon = function()
  local mark = ""
  if package.loaded["harpoon"] then
    local current_file = vim.fn.expand("%:p")

    for id, item in ipairs(require("harpoon"):list().items) do
      local item_file = vim.fn.fnamemodify(item.value, ":p")

      if item_file == current_file then
        mark = id .. " "
        break
      end
    end
  end
  return mark
end

return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local colors = {
      white = Get_hl_hex("Statement", "fg"),
      red = Get_hl_hex("Constant", "fg"),
      green = Get_hl_hex("Character", "fg"),
      blue = Get_hl_hex("Function", "fg"),
      yellow = Get_hl_hex("Function", "fg"),
      grey = Get_hl_hex("Comment", "fg"),
      dark = Get_hl_hex("StatusLineNc", "bg"),
    }

    require("lualine").setup({
      sections = {
        lualine_a = {
          {
            "filename",
            path = 0,
            symbols = {
              modified = "",
              readonly = " ",
              unnamed = "No name",
              newfile = "New file",
            },
          },
          { "branch", icon = { "", align = "right" } },
          harpoon,
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          lint_progress,
          { "diff", symbols = { added = "+", modified = "~", removed = "-" } },
          "progress",
          "location",
          { "filetype", colored = false, icon = { align = "right" } },
        },
      },

      options = {
        icons_enabled = true,
        globalstatus = true,
        disabled_filetypes = { "alpha" },
        component_separators = { left = "›", right = "‹" },
        section_separators = { left = "›", right = "‹" },

        theme = {
          normal = {
            a = { bg = colors.dark, fg = colors.white, gui = "bold" },
            b = { bg = colors.dark, fg = colors.white },
            c = { bg = colors.dark, fg = colors.white },
          },
          insert = {
            a = { bg = colors.dark, fg = colors.blue, gui = "bold" },
            b = { bg = colors.dark, fg = colors.blue },
            c = { bg = colors.dark, fg = colors.blue },
          },
          visual = {
            a = { bg = colors.dark, fg = colors.red, gui = "bold" },
            b = { bg = colors.dark, fg = colors.red },
            c = { bg = colors.dark, fg = colors.red },
          },
          replace = {
            a = { bg = colors.dark, fg = colors.green, gui = "bold" },
            b = { bg = colors.dark, fg = colors.green },
            c = { bg = colors.dark, fg = colors.green },
          },
          command = {
            a = { bg = colors.dark, fg = colors.yellow, gui = "bold" },
            b = { bg = colors.dark, fg = colors.yellow },
            c = { bg = colors.dark, fg = colors.yellow },
          },
          inactive = {
            a = { bg = colors.dark, fg = colors.gray, gui = "bold" },
            b = { bg = colors.dark, fg = colors.gray },
            c = { bg = colors.dark, fg = colors.gray },
          },
        },
      },

      extensions = {
        "nvim-tree",
        "neo-tree",
        "mason",
        "lazy",
        "fzf",
      },
    })
  end,
}
