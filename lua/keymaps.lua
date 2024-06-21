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
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Terminal keymaps
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<CR>', { desc = 'Toggle terminal' })


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

vim.keymap.set('n', '<leader>tl', toggle_list_char, { desc = 'Toggle list char' })
vim.keymap.set('n', '<leader>to', '<cmd>Outline<CR>', { desc = 'Toggle outline' })

vim.keymap.set('n', '<leader>lR', vim.lsp.buf.rename, { desc = 'Rename' })
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = 'Code action' })

vim.keymap.set('n', '<leader>Su', ':PosessionSave<cr>', { desc = 'Session update' })
vim.keymap.set('n', '<leader>Sd', require('possession').delete, { desc = 'Session delete' })

-- See `:help K` for why this keymap
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature documentation' })
vim.keymap.set('n', '<leader>ld', require('goto-preview').goto_preview_definition, { desc = 'Preview definitions' })
vim.keymap.set('n', '<leader>lr', require('goto-preview').goto_preview_references, { desc = 'Preview references' })

local fuzzy_keymaps = require('keymaps-fuzzy-picker')
fuzzy_keymaps.configure_picker(fuzzy_keymaps.supported_pickers.fzflua)
