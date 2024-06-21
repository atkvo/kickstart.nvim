local mod = { }

mod.supported_pickers = {
  telescope = '0',
  fzflua = '1',
}
function mod.configure_picker(picker)
  if picker == mod.supported_pickers.telescope then
    -- Telescope keybinds
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
        prompt_title = 'Live grep in open files',
      }
    end

    vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = 'Search in open files' })
    vim.keymap.set('n', '<leader>s?', require('telescope.builtin').builtin, { desc = 'Search select telescope' })
    vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = 'Search files' })
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'Search help' })
    vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = 'Search current word' })
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'Search by grep' })
    vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = 'Search by grep on git root' })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'Search diagnostics' })
    vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = 'Search resume' })
    vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = 'Find existing buffers' })
    vim.keymap.set('n', '<leader>ss', require('telescope.builtin').lsp_document_symbols, { desc = 'Search symbols' })
    vim.keymap.set('n', '<leader>sS', require('telescope.builtin').lsp_dynamic_workspace_symbols,
      { desc = 'Search workspace symbols' })
    vim.keymap.set('n', '<leader>sj', require('telescope.builtin').jumplist, { desc = 'Search jumplists' })

    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = 'Goto definition' })
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = 'Goto references' })
    vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, { desc = 'Goto implementation' })
    vim.keymap.set('n', 'gw', require('mini.jump2d').start, { desc = 'Goto spot' })

    vim.keymap.set('n', '<leader>u', require('telescope').extensions.undo.undo, { desc = 'Undo tree' })

    vim.keymap.set('n', '<leader>Sl', require('telescope').extensions.possession.list, { desc = 'Session list' })
  elseif picker == mod.supported_pickers.fzflua then
    vim.keymap.set('n', '<leader>/', function()
      require('fzf-lua').lgrep_curbuf()
    end, { desc = 'Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>s?', require('fzf-lua').builtin, { desc = 'Search select telescope' })
    vim.keymap.set('n', '<leader>sf', require('fzf-lua').files, { desc = 'Search files' })
    -- vim.keymap.set('n', '<leader>sh', require('fzf-lua').help_tags, { desc = 'Search help' })
    vim.keymap.set('n', '<leader>sw', require('fzf-lua').grep_cword, { desc = 'Search current word' })
    vim.keymap.set('n', '<leader>sg', require('fzf-lua').live_grep, { desc = 'Search by grep' })
    -- vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = 'Search by grep on git root' })
    vim.keymap.set('n', '<leader>sd', require('fzf-lua').lsp_document_diagnostics, { desc = 'Search diagnostics' })
    vim.keymap.set('n', '<leader>sD', require('fzf-lua').lsp_workspace_diagnostics, { desc = 'Search workspace diagnostics' })
    vim.keymap.set('n', '<leader>sr', require('fzf-lua').resume, { desc = 'Search resume' })
    vim.keymap.set('n', '<leader>sb', require('fzf-lua').buffers, { desc = 'Find existing buffers' })
    vim.keymap.set('n', '<leader>ss', require('fzf-lua').lsp_document_symbols, { desc = 'Search symbols' })
    vim.keymap.set('n', '<leader>sS', require('fzf-lua').lsp_live_workspace_symbols,
      { desc = 'Search workspace symbols' })
    vim.keymap.set('n', '<leader>sj', require('fzf-lua').jumps, { desc = 'Search jumplists' })

    vim.keymap.set('n', 'gd', require('fzf-lua').lsp_definitions, { desc = 'Goto definition' })
    vim.keymap.set('n', 'gr', require('fzf-lua').lsp_references, { desc = 'Goto references' })
    vim.keymap.set('n', 'gI', require('fzf-lua').lsp_implementations, { desc = 'Goto implementation' })
    vim.keymap.set('n', 'gw', require('mini.jump2d').start, { desc = 'Goto spot' })
  end
end

return mod