return {
  "ibhagwan/fzf-lua",
  config = function()
    local fzf = require("fzf-lua")
    require("fzf-lua").setup({
      hls = {
        border = "WinSeparator",
        preview_border = "WinSeparator",
        header_text = "Comment",
        header_bind = "Comment",
      },
      actions = {
        files = {
          ["default"] = fzf.actions.file_edit,
          ["ctrl-v"] = fzf.actions.file_split,
          ["ctrl-s"] = fzf.actions.file_vsplit,
          ["alt-q"] = fzf.actions.file_sel_to_qf,
        },
      },
      fzf_colors = {
        --["bg"] = { "bg", "Normal" },
        --["bg+"] = { "bg", "Normal" },
        ["fg"] = { "fg", "Comment" },
        ["fg+"] = { "fg", "Normal" },
        ["hl"] = { "fg", "Special" },
        ["hl+"] = { "fg", "Special" },
        ["info"] = { "fg", "PreProc" },
        ["prompt"] = { "fg", "Comment" },
        ["pointer"] = { "fg", "Special" },
        ["marker"] = { "fg", "Keyword" },
        ["spinner"] = { "fg", "Label" },
        ["header"] = { "fg", "Comment" },
        ["separator"] = { "fg", "WinSeparator" },
        ["scrollbar"] = { "fg", "WinSeparator" },
      },
      winopts = {
        preview_border = "single",
        border = "single",
        height = 0.6,
        width = 76,
        row = 0,
        col = 0.5,
        preview = {
          layout = "vertical",
          vertical = "up:44%",
          scrollbar = false,
        },
      },
    })

    --keybinds
    local map = function(keys, type, desc)
      local command = function()
        if type == "" then
          require("fzf-lua").builtin({
            winopts = {
              height = 0.2,
              width = 40,
              row = 0.4,
              col = 0.48,
            },
          })
        else
          require("fzf-lua")[type]({
            file_icons = false,
            git_icons = false,
            color_icons = false,
          })
        end
      end
      vim.keymap.set("n", keys, command, { desc = desc })
    end

    map("<leader>sa", "", "FZF")
    map("<leader>sf", "files", "Files")
    map("<leader>sh", "help_tags", "Help")
    map("<leader>sb", "buffers", "Buffers")
    map("<leader>sg", "live_grep", "Grep Word")
    map("<leader>sv", "grep_visual", "Grep Visual")
    map("<leader>sr", "oldfiles", "Recent files")
    map("<leader>sc", "grep_cword", "Current Word")
    map("<leader>sd", "diagnostics_document", "Diagnostics")

    --lsp
    map("<leader>lr", "lsp_references", "LSP References")
    map("<leader>ld", "lsp_definitions", "LSP Definitions")
    map("<leader>lI", "lsp_implementations", "LSP Implementations")
    map("<leader>lt", "lsp_typedefs", "LSP Type Definitions")
  end,
}
