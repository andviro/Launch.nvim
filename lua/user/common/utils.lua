local M = {}

M.get_cwd = function()
  local cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    -- if not git then active lsp client root
    -- will get the configured root directory of the first attached lsp. You will have problems if you are using multiple lsps
    local client = vim.lsp.get_active_clients()[1]
    if client then
      cwd = client.config.root_dir
    else
      cwd = vim.fn.expand "%:p:h"
    end
  end
  return cwd
end

return M
