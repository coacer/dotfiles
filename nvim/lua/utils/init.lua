-- Utils module
local M = {}

-- カラースキームをプレビューしながら変更できる
-- NOTE: This command depends on Unite plugin which may not be available
-- If using Telescope, consider using Telescope's colorscheme picker instead
function M.setup_colorscheme_select()
  -- Check if Unite is available
  if vim.fn.exists(':Unite') == 2 then
    vim.api.nvim_create_user_command('ColorSchemeSelect', function()
      vim.cmd('Unite colorscheme -auto-preview')
    end, {})
  else
    -- Fallback: Create a simple command without preview
    vim.api.nvim_create_user_command('ColorSchemeSelect', function()
      local colorschemes = vim.fn.getcompletion('', 'color')
      print('Available colorschemes: ' .. table.concat(colorschemes, ', '))
      print('Use :colorscheme <name> to change')
    end, {})
  end
end

-- TodayNote command - Open today's daily note in Obsidian vault
function M.setup_today_note()
  vim.api.nvim_create_user_command('TodayNote', function()
    local date = os.date('%Y-%m-%d')
    local file_path = string.format(
      '/Users/nakagamiyuki/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Obsidian_Vault/02_DailyNotes/%s.md',
      date
    )
    vim.cmd('edit ' .. file_path)
  end, {})
end

-- Load cursor-agent module
local cursor_agent = require('utils.cursor-agent')

-- Load codex module
local codex = require('utils.codex')

-- Setup all commands
function M.setup()
  M.setup_colorscheme_select()
  M.setup_today_note()
  cursor_agent.setup()
  codex.setup()
end

M.setup()
