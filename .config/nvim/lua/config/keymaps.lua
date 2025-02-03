-- dagger's neovim keymaps
vim.g.mapleader = " "

-- quickfix navigation
vim.keymap.set("n", "]q", "<cmd>cnext<CR>", { desc = "Next quickfix item" })
vim.keymap.set("n", "[q", "<cmd>cprev<CR>", { desc = "Prev quickfix item" })

-- better end and start of the line
vim.keymap.set({ "n", "v" }, "L", "$", { desc = "End of the line" })
vim.keymap.set({ "n", "v" }, "H", "^", { desc = "Start of the line" })

-- move with J and K with indents
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "" })

-- unbinds
vim.keymap.set({ "c", "i", "t" }, "<c-j>", "<nop>")
vim.keymap.set({ "c", "i", "t" }, "<c-k>", "<nop>")
vim.keymap.set({ "n", "v", "i" }, "<c-l>", "<nop>")
vim.keymap.set({ "n", "v" }, "Q", "<nop>")

-- keep cursor centered
vim.keymap.set("n", "J", "mzJ`z", { desc = "Move current line up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next result in search /" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous result in search /" })

-- next greatest remap ever : asbjornHaland (yanking and pasting)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from system clipboard" })
vim.keymap.set("v", "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- replace current word
vim.keymap.set(
  "n",
  "<leader>rp",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace current word" }
)

-- window management
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" })
vim.keymap.set("n", "<C-w>w", "<nop>")

-- tab management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
