return {
  {
    "saghen/blink.cmp",
    opts = {
      enabled = function()
        return not vim.b.assistmode
      end,
    },
  },
}
