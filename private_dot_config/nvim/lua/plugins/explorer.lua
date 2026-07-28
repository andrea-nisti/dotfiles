return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
          },
        },
      },
    },
    init = function()
      local function undim()
        -- Hidden files (and contents of hidden dirs) are dimmed by default
        -- (linked to NonText). Link them to the normal file highlight instead.
        vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { link = "SnacksPickerFile" })
      end
      vim.api.nvim_create_autocmd("ColorScheme", { callback = undim })
      undim()
    end,
  },
}
