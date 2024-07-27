function Get_hl_hex(name, option)
  if type(name) ~= "string" or (option ~= "fg" and option ~= "bg") then
    error("Invalid arguments. Usage: highlight(name: string, option: 'fg' | 'bg')")
  end
  local hl = vim.api.nvim_get_hl(0, { name = name })
  local color = hl[option]
  if not color then
    print("No " .. option .. " color found for highlight group: " .. name)
    return nil
  end
  local hex_color = string.format("#%06x", color)
  return hex_color
end

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  group = vim.api.nvim_create_augroup("Color", {}),
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(
      0,
      "BetterCmpWindow",
      { fg = Get_hl_hex("Normal", "fg"), bg = Get_hl_hex("FloatBorder", "bg") }
    )

    vim.api.nvim_set_hl(
      0,
      "FlashLabel",
      { bg = Get_hl_hex("PreProc", "fg"), fg = Get_hl_hex("NormalFloat", "bg") }
    )
    vim.api.nvim_set_hl(0, "FlashBackdrop", { link = "SignColumn" })

    --vim.api.nvim_set_hl(0, "CursorLine", { link = "None" })
    --vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { link = "CursorColumn" })
    vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { link = "Function" })
    vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { link = "Function" })
    vim.api.nvim_set_hl(0, "NeoTreeGitUnstaged", { link = "Changed" })
    vim.api.nvim_set_hl(0, "NeoTreeGitModified", { link = "Changed" })
    vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { link = "Added" })
    vim.api.nvim_set_hl(0, "NeoTreeGitRenamed", { link = "Added" })
    vim.api.nvim_set_hl(0, "NeoTreeGitConflict", { link = "Removed" })

    vim.api.nvim_set_hl(0, "WinSeparator", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { underline = true })
    --vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = Get_hl_hex("Normal", "bg") })
  end,
})
