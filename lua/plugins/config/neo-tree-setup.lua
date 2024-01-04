require('neo-tree').setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  -- filesystem = {
  --   follow_current_file = {
  --     enabled = true
  --   }
  -- }
})

local find_buffer_by_type = function(type)
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    -- local ft = vim.api.nvim_get_option_value(buf, 'filetype')
    local ft = vim.api.nvim_get_option_value('filetype', { buf = buf })
    if ft == type then return buf end
  end
  return -1
end

local toggle_neotree = function(toggle_command)
  if find_buffer_by_type 'neo-tree' > 0 then
    require('neo-tree.command').execute { action = 'close' }
  else
    toggle_command()
  end
end

vim.keymap.set(
  'n',
  '<leader>e',
  function()
    toggle_neotree(function() require('neo-tree.command').execute { action = 'focus', reveal = true, dir = vim.uv.cwd() } end)
  end,
  {desc = 'Toggle explorer (cwd)'}
)
