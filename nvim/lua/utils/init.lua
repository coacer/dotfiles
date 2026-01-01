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
    local base_dir = vim.fn.expand('~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian_Vault')
    local file_path = base_dir .. '/02_DailyNotes/' .. date .. '.md'
    local template_path = base_dir .. '/99_Systems/DailyNotesTemplate.md'

    -- ファイルが存在しない場合はテンプレートをコピー
    if vim.fn.filereadable(file_path) == 0 then
      if vim.fn.filereadable(template_path) == 1 then
        vim.fn.writefile(vim.fn.readfile(template_path), file_path)
      end
    end

    vim.cmd('edit ' .. vim.fn.fnameescape(file_path))
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
