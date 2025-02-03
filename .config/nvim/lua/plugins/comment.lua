return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  name = "comment.nvim",
  config = function()
    vim.g.skip_ts_context_commentstring_module = true

    require("Comment").setup({
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })

    require("ts_context_commentstring").setup({
      enable_autocmd = false,
      padding = true,
      mappings = {
        basic = true,
        extra = false,
      },
    })
  end,
}
