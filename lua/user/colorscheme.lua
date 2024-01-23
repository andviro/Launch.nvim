local M = {
    'ishan9299/nvim-solarized-lua',
    priority = 1000,
}

function M.config()
    vim.g.solarized_visibility = 'low'
    vim.cmd.colorscheme 'solarized'
end

return M
