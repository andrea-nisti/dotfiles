-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function black_hole_delete()
  return vim.v.register == '"' and '"_d' or "d"
end

vim.keymap.set({ "n", "x" }, "d", black_hole_delete, { expr = true, desc = "Delete without yanking" })
vim.keymap.set("n", "dd", function()
  return vim.v.register == '"' and '"_dd' or "dd"
end, { expr = true, desc = "Delete line without yanking" })
