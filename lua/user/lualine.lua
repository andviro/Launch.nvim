local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
  },
}

function M.config()
  local function imode()
    if vim.o.iminsert == 1 then
      return [[ru]]
    else
      return [[en]]
    end
  end
  require("lualine").setup {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      ignore_focus = { "NvimTree" },
    },
    sections = {
      lualine_a = { imode },
      lualine_b = { "branch" },
      lualine_c = { "diagnostics" },
      lualine_x = { "copilot", "filetype" },
      lualine_y = { "progress" },
      lualine_z = {},
    },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
