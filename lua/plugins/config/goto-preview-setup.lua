local api = require('goto-preview')
api.setup()
require('goto-preview').setup {}

vim.keymap.set('n', '<leader>pd', api.goto_preview_definition, { desc = 'Preview definitions' })
vim.keymap.set('n', '<leader>pr', api.goto_preview_references, { desc = 'Preview references' })

