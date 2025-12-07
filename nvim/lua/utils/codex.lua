-- Codex module - Manages codex terminal integration
-- Uses the generic AgentTerminal module internally for maintainability
local M = {}

-- Load the generic agent terminal module
local agent_terminal = require('utils.agent-terminal')

-- Create Codex instance using AgentTerminal
local codex_instance = agent_terminal.new({
  command = 'codex',
  name = 'Codex',
  width_ratio = 0.3,
  file_prefix = '@',
  range_format = '@%s#L%d-%d',
  resume_args = 'resume'  -- Adjust if codex uses different resume option
})

-- Expose instance for advanced usage (optional)
M.instance = codex_instance

-- Setup all codex commands and keymaps
function M.setup()
  codex_instance:setup({
    toggle = '<leader>ct',
    add_file = '<leader>cb',
    send_range = '<leader>ce',
    resume = '<leader>cr'
  })
end

return M
