return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.formatters.prettierd = {
      stdin = true,
      env = {
        PRETTIERD_LOCAL_PRETTIER_ONLY = true,
      },
      args = { vim.api.nvim_buf_get_name(0) },
    }

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        svelte = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        graphql = { "prettierd" },

        lua = { "stylua" },
        sh = { "beautysh" },
        python = { "black" },
        nix = { "nixfmt" },
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 2000,
        async = false,
      },
    })

    vim.keymap.set("n", "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 2000,
      })
    end, { desc = "Make Pretty" })

    vim.keymap.set("n", "<leader>mr", function()
      vim.notify("Restarting prettierd...")
      vim.fn.system("prettierd restart")
    end, { desc = "Make Restart" })

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      group = vim.api.nvim_create_augroup("RestartPrettierd", { clear = true }),
      pattern = "*prettier*",
      callback = function()
        vim.notify("Restarting prettierd...")
        vim.fn.system("prettierd restart")
      end,
    })

    vim.api.nvim_create_autocmd("VimLeavePre", {
      group = vim.api.nvim_create_augroup("StopPrettierd", { clear = true }),
      pattern = { "*.ts", "*.tsx", "*.js", "*.jsx", "*.css", "*.html", "*.json" },
      callback = function()
        vim.notify("Stopping prettierd...")
        vim.fn.system("prettierd stop")
      end,
    })
  end,
}
