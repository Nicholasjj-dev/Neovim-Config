return {
  {
    "saghen/blink.pairs",
    dependencies = "saghen/blink.lib",

    version = "*",

    -- Download prebuilt binaries from GitHub releases
    build = function()
      require("blink.pairs").download():pwait(60000)
    end,

    -- Or build from source instead:
    -- build = function()
    --   require("blink.pairs").build():pwait(60000)
    -- end, 

    opts = {
      mappings = {
        enabled = true,
        cmdline = true,
        disabled_filetypes = {},

        wrap = {
          ["<C-b>"] = "motion",
          ["<C-S-b>"] = "motion_reverse",
        },

        pairs = {},
      },

      highlights = {
        enabled = true,
        cmdline = true,
        groups = {
          "BlinkPairsOrange",
          "BlinkPairsPurple",
          "BlinkPairsBlue",
        },
        unmatched_group = "BlinkPairsUnmatched",

        matchparen = {
          enabled = true,
          cmdline = false,
          include_surrounding = false,
          group = "BlinkPairsMatchParen",
          priority = 250,
        },
      },

      debug = false,
    },
  },
}
