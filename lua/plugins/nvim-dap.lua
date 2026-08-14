return {
  {
    "mfussenegger/nvim-dap",

    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "jay-babu/mason-nvim-dap.nvim",
    },

    ft = { "c", "cpp" },

    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      require("nvim-dap-virtual-text").setup()

      require("mason").setup()

      require("mason-nvim-dap").setup({
        ensure_installed = { "cppdbg" },
        handlers = {
          function(config)
            require("mason-nvim-dap").default_setup(config)
          end,
        },
      })

      vim.keymap.set("n", "<leader>b<space>", ":DapContinue<CR>")
      vim.keymap.set("n", "<leader>bl", ":DapStepInto<CR>")
      vim.keymap.set("n", "<leader>bj", ":DapStepOver<CR>")
      vim.keymap.set("n", "<leader>bh", ":DapStepOut<CR>")
      vim.keymap.set("n", "<leader>bz", ":ZoomWinTabToggle<CR>")
      vim.keymap.set("n", "<leader>bp", require("dap").toggle_breakpoint)


      vim.keymap.set(
        "n",
        "<leader>bgt",
        ":lua require('dap').set_log_level('TRACE')<CR>"
      )

      vim.keymap.set(
        "n",
        "<leader>bge",
        function()
          vim.cmd(":edit " .. vim.fn.stdpath('cache') .. "/dap.log")
        end, { desc = "DapCacheLog" }
      )

      vim.keymap.set("n", "<F1>", ":DapStepOut<CR>")  -- Step out
      vim.keymap.set("n", "<F2>", ":DapStepOver<CR>") -- Step Over
      vim.keymap.set("n", "<F3>", ":DapStepInto<CR>") -- Step Into

      vim.keymap.set(
        "n",
        "<leader>b+", -- Restart DAP
        function()
          dap.restart()
        end, { desc = "DapRestart" }
      )

      vim.keymap.set(
        "n",
        "<leader>b-", -- Close DAP
        function()
          dap.terminate()
        end, { desc = "DapClose" }
      )

      vim.keymap.set(
        "n",
        "<leader>bb", -- Open DAP
        function()
          dap.continue()
        end, { desc = "DapOpen" }
      )

      vim.keymap.set("n", "<leader>bt", function()
        require("dapui").toggle()
      end, { desc = "DapUIToggle" })

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "cppdbg",
          request = "launch",
          program = function()
            return vim.fn.input(
              "Path to executable: ",
              vim.fn.getcwd() .. '/',
              'file'
            )
          end,
          cwd = '${workspaceFolder}',
          stopAtEntry = true,
        },

        {
          name = 'Attach to gdbserver :1234',
          type = 'cppdbg',
          request = 'launch',
          MIMode = 'gdb',
          miDebuggerServerAddress = 'localhost:1234',
          miDebuggerPath = '/usr/bin/gdb',
          cwd = '${workspaceFolder}',
          program = function()
            return vim.fn.input(
              'Path to executable: ',
              vim.fn.getcwd() .. '/',
              'file'
            )
          end,
        },
      }

      dap.configurations.c = dap.configurations.cpp
    end,
  },
}
