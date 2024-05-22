return {
  -- themes
  { 'catppuccin/nvim',            name = 'catppuccin', priority = 1000 },
  { 'samharju/synthweave.nvim',   priority = 1000 },
  { 'rebelot/kanagawa.nvim' },
  { 'bluz71/vim-nightfly-colors', name = 'nightfly',   lazy = false,   priority = 1000 },
  { 'bluz71/vim-moonfly-colors',  name = 'moonfly',    lazy = false,   priority = 1000 },
  { 'sainnhe/everforest',         lazy = false,        priority = 1000 },
  { 'shaunsingh/moonlight.nvim' },
  {
    "mcchrish/zenbones.nvim",
    dependencies = { "rktjmp/lush.nvim" }
  },
  { 'navarasu/onedark.nvim', priority = 1000 },
  { 'rose-pine/neovim', name = 'rose-pine' },
  { "eldritch-theme/eldritch.nvim", lazy = false, priority = 1000, opts = {} },
  {
    'maxmx03/fluoromachine.nvim',
    config = function()
      local fm = require 'fluoromachine'

      fm.setup {
        glow = false,
        -- theme = 'fluoromachine'
        theme = 'delta'
        -- theme = 'retrowave'
      }
    end
  },
  { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}, },
}
