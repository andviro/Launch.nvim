local M = {
  "mg979/vim-visual-multi",
  opts = {},
  event = "VeryLazy",
}
M.config = function()
  vim.g.VM_maps = {
    ["Select All"] = "<M-n>",
    ["Visual All"] = "<M-n>",
    ["Skip Region"] = "<C-x>",
    ["Increase"] = "+",
    ["Decrease"] = "-",
  }
end

return M
