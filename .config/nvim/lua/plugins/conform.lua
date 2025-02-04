return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.formatters.biome = {
      append_args = { "--indent-style=space" },
    }

    conform.setup({
      formatters_by_ft = {
        javascript = { "biome", "rustywind" },
        typescript = { "biome", "rustywind" },
        javascriptreact = { "biome", "rustywind" },
        typescriptreact = { "biome", "rustywind" },
        svelte = { "biome", "rustywind" },
        css = { "biome", "rustywind" },
        html = { "biome", "rustywind" },
        json = { "biome", "rustywind" },
        yaml = { "biome", "rustywind" },
        markdown = { "biome", "rustywind" },
        graphql = { "biome", "rustywind" },

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
  end,
}
