--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================

Kickstart.nvim is *not* a distribution.

Kickstart.nvim is a template for your own configuration.
  The goal is that you can read every line of code, top-to-bottom, understand
  what your configuration is doing, and modify it to suit your needs.

  Once you've done that, you should start exploring, configuring and tinkering to
  explore Neovim!

  If you don't know anything about Lua, I recommend taking some time to read through
  a guide. One possible example:
  - https://learnxinyminutes.com/docs/lua/


  And then you can explore or search through `:help lua-guide`
  - https://neovim.io/doc/user/lua-guide.html


Kickstart Guide:

I have left several `:help X` comments throughout the init.lua
You should run that command and read that help section for more information.

In addition, I have some `NOTE:` items throughout the file.
These are for you, the reader to help understand what is happening. Feel free to delete
them once you know what you're doing, but they should serve as a guide for when you
are first encountering a few different constructs in your nvim config.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now :)
--]]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy-bootstrap')
require('lazy-plugins')
require('options')
require('keymaps')

require('plugins/config/lsp-setup')
require('plugins/config/neo-tree-setup')
require('plugins/config/treesitter-setup')


-- document existing key chains
-- require('which-key').add {
--   { "<leader>]",      group = "Session" },
--   { "<leader>t",      group = "Tab" },
--   { "<leader>l",      group = "LSP" },
--   { "<leader>p",      group = "Picker" },
--   { "<leader>T",      group = "Toggle" },
--   { "<leader>v",      group = "Version Control" },
--   { "<leader>m",      group = "Match" },
--   { "<leader>g",      group = "Go" },
--
--   -- Hide simple multicursor keybinds
--   { "<leader><Up>",   hidden = true },
--   { "<leader><Down>", hidden = true },
-- }
--
-- -- register which-key VISUAL mode
-- -- required for visual <leader>hs (hunk stage) to work
-- require('which-key').add({
--   { "<leader>v", group = "Version Control" },
--   { "<leader>m", group = "Match" },
-- }, { mode = 'v' })

require('oil').setup()

-- autocmd
vim.api.nvim_create_autocmd({ 'RecordingEnter', 'RecordingLeave' }, {
  callback = function(ev)
    local recording_register = vim.fn.reg_recording()
    if ev.event == 'RecordingEnter' then
      vim.notify('Recording @' .. recording_register .. ' start')
    else
      vim.notify('Recording @' .. recording_register .. ' done')
    end
  end
})

vim.api.nvim_create_user_command('Bd', 'lua Snacks.bufdelete()', {})
