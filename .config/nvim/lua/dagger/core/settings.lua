vim.loader.enable()

-- Save undo history
vim.opt.undofile = true

-- always number line
vim.opt.nu = true

-- incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- term colors
vim.opt.termguicolors = true

-- least amount of lines while scrolling is 10
vim.opt.scrolloff = 999
vim.opt.signcolumn = "yes"

-- fast update
vim.opt.updatetime = 50

-- better indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- indent symbols
-- vim.opt.list = true
-- vim.opt.listchars = { tab = "· ", trail = " ", nbsp = "␣" }

-- Enable break indent
vim.opt.breakindent = true

vim.opt.splitright = true
vim.opt.splitbelow = true

-- line wrapping
vim.opt.wrap = false

-- highlighting on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
