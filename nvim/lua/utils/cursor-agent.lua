-- CursorAgent module - Manages cursor-agent terminal integration
-- Uses the generic AgentTerminal module internally for maintainability
local M = {}

-- Load the generic agent terminal module
local agent_terminal = require('utils.agent-terminal')

-- Create CursorAgent instance using AgentTerminal
local cursor_agent_instance = agent_terminal.new({
  command = 'cursor-agent',
  name = 'CursorAgent',
  width_ratio = 0.3,
  file_prefix = '@',
  range_format = '@%s#L%d-%d'
})

-- Expose instance for advanced usage (optional)
M.instance = cursor_agent_instance

-- Setup all cursor-agent commands and keymaps
function M.setup()
  cursor_agent_instance:setup({
    toggle = '<leader>st',
    add_file = '<leader>sb',
    send_range = '<leader>se',
    resume = '<leader>sr'
  })
end

return M
