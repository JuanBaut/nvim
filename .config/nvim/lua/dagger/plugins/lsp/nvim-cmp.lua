return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      build = (function()
        if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
          return
        end
        return "make install_jsregexp"
      end)(),
      dependencies = {
        {
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
          end,
        },
      },
    },
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    luasnip.config.setup({})

    local cmd_format = {
      format = function(entry, vim_item)
        vim_item.kind = ("")[entry]
        return vim_item
      end,
    }

    cmp.setup({
      window = {
        completion = cmp.config.window.bordered({ border = "single" }),
        documentation = cmp.config.window.bordered({ border = "single" }),
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = "menu,menuone,noinsert" },
      mapping = cmp.mapping.preset.insert({
        ["<c-n>"] = cmp.mapping.select_next_item(),
        ["<c-p>"] = cmp.mapping.select_prev_item(),

        ["<c-k>"] = cmp.mapping.scroll_docs(-4),
        ["<c-j>"] = cmp.mapping.scroll_docs(4),

        ["<c-y>"] = cmp.mapping.confirm(),
        ["<c-c>"] = cmp.mapping.abort(),

        ["<c-Space>"] = cmp.mapping.complete({}),

        ["<c-l>"] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { "i", "s" }),
        ["<c-h>"] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { "i", "s" }),
      }),

      cmp.setup.cmdline({ "/", "?" }, {
        formatting = cmd_format,
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      }),

      cmp.setup.cmdline(":", {
        formatting = cmd_format,
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      }),

      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
      },

      -- configure lspkind for vs-code like pictograms in completion menu and also nvim-highlight-colors
      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, item)
          local color = require("nvim-highlight-colors").format(entry, { kind = item.kind })
          local new_item = lspkind.cmp_format({
            mode = "symbol",
            maxwidth = 20,
            ellipsis_char = "...",
          })(entry, item)

          local strings = vim.split(new_item.kind, "%s")
          new_item.kind = (strings[1] or "")
          new_item.menu = ""

          if color.abbr_hl_group then
            new_item.kind_hl_group = color.abbr_hl_group
            new_item.kind = color.abbr
          end
          return new_item
        end,
      },
    })
  end,
}
