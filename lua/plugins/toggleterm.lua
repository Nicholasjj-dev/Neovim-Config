return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      direction = "horizontal",
      size = 15,

     -- Open terminal in the directory of the current file
      dir = function()
        return vim.fn.expand("%:p:h")
      end,
    })
    
    local keymap = vim.keymap
      
    keymap.set("n", "<leader>t1", "<cmd>1ToggleTerm<CR>", { desc = "Terminal 1" })
    keymap.set("n", "<leader>t2", "<cmd>2ToggleTerm<CR>", { desc = "Terminal 2" })
    keymap.set("n", "<leader>t3", "<cmd>3ToggleTerm<CR>", { desc = "Terminal 3" })
    
    keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

    keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]])
    keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]])
    keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]])
    keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]])

  end,
}
