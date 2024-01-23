local M = {}

local function lsp_keymaps(bufnr)
  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end
    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end
  nmap("<CR>", "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition")
  nmap("<C-k>", "<cmd>Telescope diagnostics<cr>", "Telescope diagnostics")
  nmap("K", "<cmd>lua vim.lsp.buf.hover()<CR>", "Help")

  nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

  nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
  -- nmap("<leader>q", vim.diagnostic.setqflist, "[Q]uikfix diagnostics")
  nmap("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic message")
  nmap("]d", vim.diagnostic.goto_next, "Go to next diagnostic message")
  nmap("<leader>e", vim.diagnostic.open_float, "Open floating diagnostic message")
  nmap("<leader>q", vim.diagnostic.setloclist, "Open diagnostics list")
  --nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  --nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  nmap("<leader><CR>", vim.lsp.buf.references, "[CR] symbol references")

  -- See `:help K` for why this keymap
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

  -- Lesser used LSP functionality
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
  nmap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "[W]orkspace [L]ist Folders")
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    vim.lsp.buf.format()
  end, { desc = "Format current buffer with LSP" })
  -- if client.supports_method "textDocument/inlayHint" then
  --   vim.lsp.inlay_hint.enable(bufnr, true)
  -- end
end

M.servers = {
  "lua_ls",
  "cssls",
  "html",
  "tsserver",
  "eslint",
  "tsserver",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
  "bufls",
}

return M
