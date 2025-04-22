-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })

vim.keymap.set('n', '<leader>tn', ':tabnext<cr>', { silent = true, desc = 'Next tab' })
vim.keymap.set('n', '<leader>tp', ':tabprevious<cr>', { silent = true, desc = 'Previous tab' })
vim.keymap.set('n', '<leader>tl', ':Tabby pick_window<cr>', { silent = true, desc = 'Tab list' })
vim.keymap.set('n', '<leader>tc', ':tabclose<cr>', { silent = true, desc = 'Close'})
vim.keymap.set('n', '<leader>tN', ':tabnew<cr>', { silent = true, desc = 'New tab' })

vim.keymap.set('n', '<leader>tmn', ':+tabmove<cr>', { silent = true, desc = 'Move tab next position' })
vim.keymap.set('n', '<leader>tmp', ':-tabmove<cr>', { silent = true, desc = 'Move tab previous position'})

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Terminal keymaps
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
vim.keymap.set('n', '<leader>Tt', '<cmd>ToggleTerm<CR>', { desc = 'Toggle terminal' })


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

vim.keymap.set('n', '<leader>Tl', toggle_list_char, { desc = 'Toggle list char' })
vim.keymap.set('n', '<leader>To', '<cmd>Outline<CR>', { desc = 'Toggle outline' })

vim.keymap.set('n', '<leader>lR', vim.lsp.buf.rename, { desc = 'Rename' })
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = 'Code action' })
vim.keymap.set('n', '<leader>lF', vim.lsp.buf.format, { desc = 'Format' })

-- See `:help K` for why this keymap
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature documentation' })
vim.keymap.set('n', '<leader>ld', require('goto-preview').goto_preview_definition, { desc = 'Preview definitions' })
vim.keymap.set('n', '<leader>lr', require('goto-preview').goto_preview_references, { desc = 'Preview references' })

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Goto definition' })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Goto references' })
vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { desc = 'Goto implementation' })

local fuzzy_keymaps = require('keymaps-fuzzy-picker')
fuzzy_keymaps.configure_picker(fuzzy_keymaps.supported_pickers.snacks)
-- fuzzy_keymaps.configure_picker(fuzzy_keymaps.supported_pickers.telescope)
