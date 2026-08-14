return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "c", "cpp", "java", "lua", "python" },
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      auto_install = false
    },
  },
}
