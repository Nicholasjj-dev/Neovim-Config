return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    -- List of servers for mason to install
    ensure_installed = {
      "jdtls",
      "lua_ls",
      "pylsp",
    },
  },
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      },

    },
    "neovim/nvim-lspconfig",
  },

  config = function()
    vim.lsp.config("clangd", {
      cmd = { "/run/current-system/sw/bin/clangd" },
    })

    vim.lsp.enable("clangd")
  end,

  vim.lsp.config('pylsp', {
    cmd = { 'pylsp' },
    filetypes = { 'python' },
    root_markers = {
      'git',
      'setup.py',
      'setup.cfg',
      'requirements.txt',
      'Pipfile',
      '.git',
    },
    vim.lsp.enable("pylsp"),
  }),

  vim.lsp.enable("lua_ls"),
  vim.lsp.enable("jdtls"),
}
