-- [[ Configure LSP ]]

-- Setup neovim lua configuration
require('neodev').setup()
local cwd = vim.fn.getcwd()
local project_lsp_config_filename = "project_lspconfig.lua"
local project_lsp_config_path = vim.fn.fnamemodify(cwd.. "/" .. project_lsp_config_filename, ":p")

if vim.fn.filereadable(project_lsp_config_path) == 1 then
  -- local project_lsp_config_path = project_lsp_config_path
  require('project_lspconfig')
else
  local lspconfig = require('lspconfig')
  lspconfig.clangd.setup {}
  -- lspconfig.ccls.setup {
  --   init_options = {
  --     cache = {
  --       directory = ".ccls-cache";
  --     };
  --   }
  -- }

  lspconfig.rust_analyzer.setup {}
  lspconfig.pyright.setup {}
  lspconfig.lua_ls.setup {}
  lspconfig.zls.setup {
    settings = {
      zls = {
        enable_build_on_save = true,
        build_on_save_step = "check",
      }
    }
  }

end


-- require('lspconfig').clangd.setup{
--   cmd = {
--     'clangd',
--     '-j=8',
--     '--malloc-trim',
--     '--background-index'
--   },
--   on_attach = on_attach,
-- }
