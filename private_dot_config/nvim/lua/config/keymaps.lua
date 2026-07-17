-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function black_hole_delete(key)
  return vim.v.register == '"' and '"_' .. key or key
end

for _, key in ipairs({ "d", "D", "x", "X" }) do
  vim.keymap.set({ "n", "x" }, key, function()
    return black_hole_delete(key)
  end, { expr = true, desc = "Delete without yanking" })
end

vim.keymap.set("n", "dd", function()
  return black_hole_delete("dd")
end, { expr = true, desc = "Delete line without yanking" })
