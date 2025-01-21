return {
  "alexghergh/nvim-tmux-navigation",
  config = function()
    local tmux_nav = require("nvim-tmux-navigation")

    --tmux_nav.setup({
    --  disable_when_zoomed = true, -- defaults to false
    --})

    vim.keymap.set("n", "<c-i>", tmux_nav.NvimTmuxNavigateNext)
  end,
}
