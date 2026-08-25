vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- IDE Run keybind
vim.keymap.set("n", "<leader>r", function()
  vim.cmd("!~/scripts/cmake-run")
end, { desc = "Build and run CMake project" })

-- Ctrl-c
vim.keymap.set("v", "<C-c>", '"+y"', { desc = "Copy to system clipboard" })

-- Window Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Toggles Assist Mode

vim.keymap.set("n", "<leader>am", function()
  vim.b.assistmode = not vim.b.assistmode

  if vim.b.assistmode then
    -- Stop diagnostics from being displayed
    vim.diagnostic.enable(false, { bufnr = 0 })

    -- Remove diagnostics that are already displayed
    vim.diagnostic.hide(nil, 0)

    vim.notify("Assist Mode: ON")
  else
    -- Allow diagnostics again
    vim.diagnostic.enable(true, { bufnr = 0 })

    -- Redisplay diagnostics
    vim.diagnostic.show(nil, 0)

    vim.notify("Assist Mode: OFF")
  end
end, {
  desc = "Toggle Assist Mode",
})
