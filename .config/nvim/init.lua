require("config")

if vim.g.neovide then
  vim.o.guifont = "Input Mono,Symbols Nerd Font Mono:h12"
  vim.opt.linespace = 3
  vim.g.neovide_show_border = true
  vim.g.neovide_scroll_animation_lenght = 0.1
end
