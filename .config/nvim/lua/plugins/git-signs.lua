return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local gitsigns = require("gitsigns")
    gitsigns.setup()

    local function map(mode, l, r, opts)
      opts = opts or {}
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "]c", function()
      if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
      else
        gitsigns.nav_hunk("next")
      end
    end)

    map("n", "[c", function()
      if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
      else
        gitsigns.nav_hunk("prev")
      end
    end)

    -- Actions
    map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
    map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
    map("v", "<leader>hs", function()
      gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { desc = "Stage selection" })
    map("v", "<leader>hr", function()
      gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { desc = "Reset selection" })

    map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage Buffer" })
    map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset Buffer" })
    map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview Hunk" })

    --map("n", "<leader>hb", function()
    --	gitsigns.blame_line({ full = true })
    --end, { desc = "Blame Line" })
    map("n", "<leader>hb", gitsigns.toggle_current_line_blame, { desc = "Toggle Blame Line" })

    map("n", "<leader>hd", gitsigns.diffthis, { desc = "Show Diff" })
    map("n", "<leader>hD", function()
      gitsigns.diffthis("~")
    end, { desc = "Show Complete Diff" })

    map("n", "<leader>hx", gitsigns.preview_hunk_inline, { desc = "Toggle Deleted" })

    -- Text object
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select Hunk" })
  end,
}
