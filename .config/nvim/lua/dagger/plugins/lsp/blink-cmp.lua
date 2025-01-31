return {
  "saghen/blink.cmp",
  --dependencies = "rafamadriz/friendly-snippets",

  dependencies = {
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip.loaders.from_vscode").lazy_load({
            paths = { vim.fn.stdpath("config") .. "/snippets" },
          })
        end,
      },
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  },
  version = "*",
  opts = {
    snippets = {
      preset = "luasnip",
    },

    keymap = {
      ["<C-l>"] = { "snippet_forward", "fallback" },
      ["<C-h>"] = { "snippet_backward", "fallback" },
    },

    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 300,
        window = {
          border = { "─", "─", "┐", "│", "┘", "─", "─", " " },
          max_height = 10,
          winhighlight = "Normal:BlinkCmpDoc,FloatBorder:WinBorder,EndOfBuffer:BlinkCmpDoc",
        },
      },
      ghost_text = {
        enabled = false,
      },

      menu = {
        border = "single",
        winhighlight = "Normal:BlinkCmpMenu,FloatBorder:WinBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
      },
    },

    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "normal",

      kind_icons = {
        Text = "󰦨",
        Method = "󰊕",
        Function = "󰊕",
        Constructor = "󰒓",

        Field = "󰜢",
        Variable = "󰆦",
        Property = "",

        Class = "󱡠",
        Interface = "󱡠",
        Struct = "󱡠",
        Module = "󰅩",

        Unit = "󰪚",
        Value = "",
        Enum = "",
        EnumMember = "",

        Keyword = "󰌋",
        Constant = "󰏿",

        Snippet = "󰅪",
        Color = "󰏘",
        File = "󰈔",
        Reference = "󰬲",
        Folder = "󰉋",
        Event = "󱐋",
        Operator = "󰪚",
        TypeParameter = "",
      },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
  opts_extend = { "sources.default" },
}
