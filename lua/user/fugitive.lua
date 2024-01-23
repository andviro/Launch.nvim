local M = {
  "tpope/vim-fugitive",
  event = "VeryLazy",
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>gs"] = { "<cmd>Git<cr>", "Git status" },
    ["<leader>ga"] = { "<cmd>Git add %<cr>", "Git add buffer" },
    ["<leader>gA"] = { "<cmd>Git add -A .<cr>", "Git add all" },
    ["<leader>gB"] = { "<cmd>GitBlameToggle<cr>", "Toggle Blame" },
    ["<leader>gc"] = { "<cmd>Git commit -v<cr>", "Git commit" },
    ["<leader>gC"] = { "<cmd>Git commit -a -v<cr>", "Git commit -a" },
    ["<leader>gp"] = { "<cmd>Git push -u origin HEAD<cr>", "Git push to HEAD" },
    ["<leader>gu"] = { "<cmd>Git pull<cr>", "Git pull" },
  }
end

return M
