-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Terminal keymaps
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])


-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local function toggle_list_char()
  vim.o.list = not vim.o.list
end

vim.keymap.set('n', '<leader>tl', toggle_list_char, { desc = 'toggle list char' })

-- Telescope keybinds
-- See `:help telescope.builtin`
-- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
-- vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Fuzzily search in current buffer' })

local function telescope_live_grep_open_files()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end


vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = 'Search in open files' })
vim.keymap.set('n', '<leader>s?', require('telescope.builtin').builtin, { desc = 'Search select telescope' })
-- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').git_files, { desc = 'Search [G]it files' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = 'Search files' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'Search help' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = 'Search current word' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'Search by grep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = 'Search by grep on git root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'Search diagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = 'Search resume' })
-- vim.keymap.set('n', '<leader>s?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = 'Find existing buffers' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').lsp_document_symbols, { desc = 'Search symbols' })
vim.keymap.set('n', '<leader>sS', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = 'Search workspace symbols' })
vim.keymap.set('n', '<leader>sj', require('telescope.builtin').jumplist, { desc = 'Search jumplists' })

vim.keymap.set('n', '<leader>ld', require('goto-preview').goto_preview_definition, { desc = 'Preview definitions' })
vim.keymap.set('n', '<leader>lr', require('goto-preview').goto_preview_references, { desc = 'Preview references' })

  vim.keymap.set('n', '<leader>lR', vim.lsp.buf.rename, { desc = 'Rename' })
  vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = 'Code Action' })

  vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = 'Goto Definition' })
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = 'Goto References'})
  vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, { desc = 'Goto Implementation'})
  -- vim.keymap.set('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  -- vim.keymap.set('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  -- vim.keymap.set('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation' })

  -- Lesser used LSP functionality
  -- vim.keymap.set('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  -- vim.keymap.set('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  -- vim.keymap.set('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  -- vim.keymap.set('<leader>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, '[W]orkspace [L]ist Folders')
vim.keymap.set('n', 'gw', require('mini.jump2d').start, { desc = 'Jump to spot' })
