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
require('plugins/config/goto-preview-setup')
require('plugins/config/neo-tree-setup')
require('plugins/config/telescope-setup')
require('plugins/config/treesitter-setup')
require('plugins/config/toggleterm-setup')

-- document existing key chains
require('which-key').add {
    { "<leader>S", group = "Session" },
    { "<leader>T", group = "Tab" },
    { "<leader>l", group = "LSP" },
    { "<leader>s", group = "Search" },
    { "<leader>t", group = "Toggle" },
    { "<leader>v", group = "Version Control" },
    { "<leader>m", group = "Match" },
}

-- register which-key VISUAL mode
-- required for visual <leader>hs (hunk stage) to work
require('which-key').add({
  ['<leader>'] = { name = 'VISUAL <leader>' },
  ['<leader>h'] = { 'Git [H]unk' },
}, { mode = 'v' })

require('oil').setup()
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
