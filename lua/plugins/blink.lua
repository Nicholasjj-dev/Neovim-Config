return {
  {
    "saghen/blink.cmp",
    version = "*",
    opts = {
      enabled = function()
        return not vim.b.assistmode
      end,

      keymap = {
        preset = "default",

        ["<Tab>"] = {
          "select_next",
          "fallback",
        },

        ["<S-Tab>"] = {
          "select_prev",
          "fallback",
        },

        ["<CR>"] = {
          "accept",
          "fallback",
        },

        ["<C-e>"] = {
          "hide",
          "fallback",
        },

        ["<C-Space>"] = {
          "show",
          "fallback",
        },
      },

      completion = {
        documentation = {
          auto_show = true,
        },
      },
    },
  },
}
