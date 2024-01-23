local M = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  -- local diagnostics = null_ls.builtins.diagnostics
  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  null_ls.setup {
    debug = false,
    sources = {
      formatting.stylua,
      formatting.prettier,
      formatting.black,
      -- formatting.prettier.with {
      --   extra_filetypes = { "toml" },
      --   -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      -- },
      -- formatting.eslint,
      null_ls.builtins.diagnostics.flake8,
      -- diagnostics.flake8,
      null_ls.builtins.completion.spell,
    },
    on_attach = function(client, bufnr)
      if client.supports_method "textDocument/formatting" then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
            -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
            vim.lsp.buf.format { async = false }
          end,
        })
      end
    end,
  }
end

return M
