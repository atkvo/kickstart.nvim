-- [[ Configure LSP ]]

-- Setup neovim lua configuration
local cwd = vim.fn.getcwd()
local project_lsp_config_filename = "project_lspconfig.lua"
local project_lsp_config_path = vim.fn.fnamemodify(cwd.. "/" .. project_lsp_config_filename, ":p")

if vim.fn.filereadable(project_lsp_config_path) == 1 then
  require('project_lspconfig')
else
  vim.lsp.config('clangd', {
    cmd = {
      "clangd",
      "--background-index=true",
      "-j=4",
      "--pch-storage=memory",
      "--malloc-trim"
    }
  })
  vim.lsp.enable('clangd')

  vim.lsp.enable('rust_analyzer')
  vim.lsp.enable('pyright')
  vim.lsp.enable('lua_ls')
  vim.lsp.enable('zls')

  -- lspconfig.zls.setup {
  --   settings = {
  --     zls = {
  --       enable_build_on_save = true,
  --       build_on_save_step = "check",
  --     }
  --   }
  -- }

  -- vim.lsp.enable('bashls')
end
