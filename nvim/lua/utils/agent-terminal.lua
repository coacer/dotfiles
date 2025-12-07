-- AgentTerminal module - Generic terminal management for agent CLI tools
-- Supports multiple agent instances (cursor-agent, claude-dev, aider, etc.)

local M = {}

-- AgentTerminal class
local AgentTerminal = {}
AgentTerminal.__index = AgentTerminal

-- Create a new agent terminal instance
-- @param config table: Configuration table
--   - command (string, required): CLI command name (e.g., 'cursor-agent', 'claude-dev')
--   - name (string, required): Agent name (used for command names and state)
--   - width_ratio (number, optional): Window width ratio (default: 0.3)
--   - file_prefix (string, optional): Prefix for file paths (default: '@')
--   - range_format (string, optional): Format string for range sending (default: '@%s#L%d-%d')
--   - resume_args (string, optional): Arguments for resume command (default: '--resume')
--   - keymaps (table, optional): Custom keymap configuration
function AgentTerminal.new(config)
  local self = setmetatable({}, AgentTerminal)

  -- Validate required config
  if not config.command then
    error("AgentTerminal: 'command' is required")
  end
  if not config.name then
    error("AgentTerminal: 'name' is required")
  end

  -- Set configuration with defaults
  self.command = config.command
  self.name = config.name
  self.width_ratio = config.width_ratio or 0.3
  self.file_prefix = config.file_prefix or '@'
  self.range_format = config.range_format or '@%s#L%d-%d'
  self.resume_args = config.resume_args or '--resume'

  -- State management (per instance)
  self.state = {
    bufnr = nil,
    channel = nil,
    winid = nil
  }

  -- Commands initialized flag
  self.commands_setup = false

  return self
end

-- Check if window is valid and visible
function AgentTerminal:is_window_open()
  return self.state.winid and vim.api.nvim_win_is_valid(self.state.winid)
end

-- Adjust window width to maintain configured ratio
function AgentTerminal:adjust_width()
  if not self:is_window_open() then
    return
  end

  local current_width = vim.api.nvim_win_get_width(self.state.winid)
  local screen_width = vim.o.columns
  local target_width = math.floor(screen_width * self.width_ratio)

  -- Adjust width if it's not exactly the target ratio
  if current_width ~= target_width then
    vim.api.nvim_win_set_width(self.state.winid, target_width)
  end
end

-- Open agent terminal window
-- @param args string: Command line arguments (only used on first launch)
function AgentTerminal:open_window(args)
  -- Already open, do nothing
  if self:is_window_open() then
    return
  end

  -- Calculate window width
  local width = vim.o.columns
  local split_width = math.floor(width * self.width_ratio)

  -- Open or reuse buffer
  if self.state.bufnr and vim.api.nvim_buf_is_valid(self.state.bufnr) then
    -- Reuse existing buffer (ignore args)
    vim.cmd('vsplit')
    vim.cmd('wincmd L')
    vim.cmd('vertical resize ' .. split_width)
    vim.api.nvim_win_set_buf(0, self.state.bufnr)
    self.state.winid = vim.api.nvim_get_current_win()
  else
    -- Create new terminal with optional args
    vim.cmd('vsplit')
    vim.cmd('wincmd L')
    vim.cmd('vertical resize ' .. split_width)

    -- Create a new empty buffer for the terminal
    local bufnr = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_win_set_buf(0, bufnr)

    -- Build command with args
    local cmd = self.command
    if args and args ~= '' then
      cmd = cmd .. ' ' .. args
    end

    -- Split command into parts and use termopen
    local cmd_parts = vim.split(cmd, ' ', { trimempty = true })
    local channel = vim.fn.termopen(cmd_parts, {
      on_exit = function(job_id, exit_code, event_type)
        -- Auto-cleanup when terminal process exits
        vim.schedule(function()
          -- Close window first if it's still valid
          if self.state.winid and vim.api.nvim_win_is_valid(self.state.winid) then
            vim.api.nvim_win_close(self.state.winid, true)
          end

          -- Delete buffer if it's still valid
          if self.state.bufnr and vim.api.nvim_buf_is_valid(self.state.bufnr) then
            vim.api.nvim_buf_delete(self.state.bufnr, { force = true })
          end

          -- Clear state
          self.state = {
            bufnr = nil,
            channel = nil,
            winid = nil
          }
        end)
      end
    })

    self.state.bufnr = bufnr
    self.state.channel = channel
    self.state.winid = vim.api.nvim_get_current_win()

    -- Hide buffer from buffer list and normal buffer navigation
    vim.bo[self.state.bufnr].buflisted = false  -- Hide from :ls, :bn/:bp, Telescope
    vim.bo[self.state.bufnr].bufhidden = "hide" -- Keep buffer when window is closed
  end

  -- Ensure window width is exactly the configured ratio
  self:adjust_width()

  -- Fix window width to prevent manual resizing
  if self.state.winid then
    vim.wo[self.state.winid].winfixwidth = true
  end

  vim.cmd('startinsert')
end

-- Toggle agent terminal window
-- @param args string: Command line arguments (only used on first launch)
function AgentTerminal:toggle(args)
  -- If window is open, close it (toggle behavior regardless of args)
  if self:is_window_open() then
    vim.api.nvim_win_close(self.state.winid, false)
    self.state.winid = nil
    return
  end

  -- Open the window with args (only used on first launch)
  self:open_window(args)
end

-- Send text to terminal
-- @param text string: Text to send
function AgentTerminal:send_text(text)
  -- Always open the window (creates terminal on first call, without args)
  self:open_window('')

  -- Send text followed by a space (not Enter, so user can edit)
  vim.fn.chansend(self.state.channel, text .. " ")

  -- Focus the terminal window
  if self:is_window_open() then
    vim.api.nvim_set_current_win(self.state.winid)
    vim.cmd('startinsert')
  end

  return true
end

-- Add file path to agent input
-- @param filepath string: File path to send
function AgentTerminal:add_file(filepath)
  -- Expand special characters like % (current file)
  filepath = vim.fn.expand(filepath)

  -- Convert to relative path from cwd
  filepath = vim.fn.fnamemodify(filepath, ':.')

  -- Send to terminal with prefix
  return self:send_text(self.file_prefix .. filepath)
end

-- Send visual selection range to agent
-- @param start_line number: Start line number
-- @param end_line number: End line number
function AgentTerminal:send_range(start_line, end_line)
  -- Get current file path (relative to cwd)
  local filepath = vim.fn.expand('%')
  filepath = vim.fn.fnamemodify(filepath, ':.')

  -- Format using configured range format
  local text = string.format(self.range_format, filepath, start_line, end_line)

  return self:send_text(text)
end

-- Setup commands and keymaps
-- @param keymaps table (optional): Custom keymap configuration
--   - toggle (string, optional): Keymap for toggle command
--   - add_file (string, optional): Keymap for add file command
--   - send_range (string, optional): Keymap for send range command
--   - resume (string, optional): Keymap for resume command
function AgentTerminal:setup(keymaps)
  keymaps = keymaps or {}

  -- Command names based on agent name
  local cmd_name = self.name
  local cmd_toggle = cmd_name
  local cmd_add = cmd_name .. 'Add'
  local cmd_send = cmd_name .. 'Send'

  -- Setup toggle command
  vim.api.nvim_create_user_command(cmd_toggle, function(opts)
    self:toggle(opts.args)
  end, {
    nargs = '*'  -- Accept any number of arguments
  })

  -- Setup add file command
  vim.api.nvim_create_user_command(cmd_add, function(opts)
    self:add_file(opts.args)
  end, {
    nargs = 1,
    complete = 'file'
  })

  -- Setup send range command
  vim.api.nvim_create_user_command(cmd_send, function()
    -- Get visual selection range
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")

    self:send_range(start_line, end_line)
  end, {
    range = true
  })

  -- Setup keymaps if provided
  if keymaps.toggle then
    vim.keymap.set('n', keymaps.toggle, ':' .. cmd_toggle .. '<CR>', {
      desc = 'Toggle ' .. self.name,
      silent = true
    })
  end

  if keymaps.add_file then
    vim.keymap.set('n', keymaps.add_file, ':' .. cmd_add .. ' %<CR>', {
      desc = 'Add current buffer to ' .. self.name,
      silent = true
    })
  end

  if keymaps.send_range then
    vim.keymap.set('v', keymaps.send_range, ':' .. cmd_send .. '<CR>', {
      desc = 'Send visual selection to ' .. self.name,
      silent = true
    })
  end

  if keymaps.resume then
    vim.keymap.set('n', keymaps.resume, ':' .. cmd_toggle .. ' ' .. self.resume_args .. '<CR>', {
      desc = 'Resume ' .. self.name,
      silent = true
    })
  end

  -- Monitor window resize events to maintain exact width ratio
  vim.api.nvim_create_autocmd('WinResized', {
    callback = function()
      self:adjust_width()
    end
  })

  self.commands_setup = true
end

-- Export AgentTerminal class
M.AgentTerminal = AgentTerminal

-- Convenience function to create a new agent instance
function M.new(config)
  return AgentTerminal.new(config)
end

return M
