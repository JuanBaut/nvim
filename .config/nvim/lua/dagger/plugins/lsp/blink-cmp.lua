return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  version = "*",
  opts = {
    keymap = {
      ["<C-l>"] = { "snippet_forward", "fallback" },
      ["<C-h>"] = { "snippet_backward", "fallback" },
    },

    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 300,
      },
      ghost_text = {
        enabled = false,
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
