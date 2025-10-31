-- CursorAgent module - Manages cursor-agent terminal integration
local M = {}

-- Global state for CursorAgent terminal
_G.cursor_agent_state = {
  bufnr = nil,
  channel = nil,
  winid = nil
}

-- Helper function to check if window is valid and visible
local function is_cursor_agent_window_open()
  local state = _G.cursor_agent_state
  return state.winid and vim.api.nvim_win_is_valid(state.winid)
end

-- Helper function to open cursor-agent window
-- args: command line arguments for cursor-agent (only used on first launch)
local function open_cursor_agent_window(args)
  local state = _G.cursor_agent_state

  -- Already open, do nothing
  if is_cursor_agent_window_open() then
    return
  end

  -- Calculate window width (30% of screen)
  local width = vim.o.columns
  local split_width = math.floor(width * 0.3)

  -- Open or reuse buffer
  if state.bufnr and vim.api.nvim_buf_is_valid(state.bufnr) then
    -- Reuse existing buffer (ignore args)
    vim.cmd('vsplit')
    vim.cmd('wincmd L')
    vim.cmd('vertical resize ' .. split_width)
    vim.api.nvim_win_set_buf(0, state.bufnr)
    state.winid = vim.api.nvim_get_current_win()
  else
    -- Create new terminal with optional args
    vim.cmd('vsplit')
    vim.cmd('wincmd L')
    vim.cmd('vertical resize ' .. split_width)

    -- Create a new empty buffer for the terminal
    local bufnr = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_win_set_buf(0, bufnr)

    -- Build command with args
    local cmd = 'cursor-agent'
    if args and args ~= '' then
      cmd = cmd .. ' ' .. args
    end

    -- Split command into parts and use termopen
    local cmd_parts = vim.split(cmd, ' ', { trimempty = true })
    local channel = vim.fn.termopen(cmd_parts, {
      on_exit = function(job_id, exit_code, event_type)
        -- Auto-cleanup when terminal process exits
        vim.schedule(function()
          local cleanup_state = _G.cursor_agent_state

          -- Close window first if it's still valid
          if cleanup_state.winid and vim.api.nvim_win_is_valid(cleanup_state.winid) then
            vim.api.nvim_win_close(cleanup_state.winid, true)
          end

          -- Delete buffer if it's still valid
          if cleanup_state.bufnr and vim.api.nvim_buf_is_valid(cleanup_state.bufnr) then
            vim.api.nvim_buf_delete(cleanup_state.bufnr, { force = true })
          end

          -- Clear global state
          _G.cursor_agent_state = {
            bufnr = nil,
            channel = nil,
            winid = nil
          }
        end)
      end
    })

    state.bufnr = bufnr
    state.channel = channel
    state.winid = vim.api.nvim_get_current_win()

    -- Hide buffer from buffer list and normal buffer navigation
    vim.bo[state.bufnr].buflisted = false  -- Hide from :ls, :bn/:bp, Telescope
    vim.bo[state.bufnr].bufhidden = "hide" -- Keep buffer when window is closed
  end

  vim.cmd('startinsert')
end

-- Helper function to send text to terminal
local function send_to_cursor_agent(text)
  -- Always open the window (creates terminal on first call, without args)
  open_cursor_agent_window('')

  local state = _G.cursor_agent_state

  -- Send text followed by a space (not Enter, so user can edit)
  vim.fn.chansend(state.channel, text .. " ")

  -- Focus the terminal window
  if is_cursor_agent_window_open() then
    vim.api.nvim_set_current_win(state.winid)
    vim.cmd('startinsert')
  end

  return true
end

-- CursorAgent command - Toggle cursor-agent terminal on the right side (30% width)
-- Accepts arguments (e.g., :CursorAgent --resume) which are only used on first launch
function M.setup_cursor_agent()
  vim.api.nvim_create_user_command('CursorAgent', function(opts)
    local state = _G.cursor_agent_state

    -- If window is open, close it (toggle behavior regardless of args)
    if is_cursor_agent_window_open() then
      vim.api.nvim_win_close(state.winid, false)
      state.winid = nil
      return
    end

    -- Open the window with args (only used on first launch)
    open_cursor_agent_window(opts.args)
  end, {
    nargs = '*'  -- Accept any number of arguments
  })
end

-- CursorAgentAdd command - Add file path to cursor-agent input
function M.setup_cursor_agent_add()
  vim.api.nvim_create_user_command('CursorAgentAdd', function(opts)
    local filepath = opts.args

    -- Expand special characters like % (current file)
    filepath = vim.fn.expand(filepath)

    -- Convert to relative path from cwd
    filepath = vim.fn.fnamemodify(filepath, ':.')

    -- Send to terminal with @ prefix
    send_to_cursor_agent('@' .. filepath)
  end, {
    nargs = 1,
    complete = 'file'
  })
end

-- CursorAgentSend command - Send visual selection range to cursor-agent
function M.setup_cursor_agent_send()
  vim.api.nvim_create_user_command('CursorAgentSend', function()
    -- Get visual selection range
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")

    -- Get current file path (relative to cwd)
    local filepath = vim.fn.expand('%')
    filepath = vim.fn.fnamemodify(filepath, ':.')

    -- Format: @filepath#L{start}-{end}
    local text = string.format('@%s#L%d-%d', filepath, start_line, end_line)

    send_to_cursor_agent(text)
  end, {
    range = true
  })
end

-- Setup all cursor-agent commands
function M.setup()
  M.setup_cursor_agent()
  M.setup_cursor_agent_add()
  M.setup_cursor_agent_send()

  -- Setup keymaps
  vim.keymap.set('n', '<leader>st', ':CursorAgent<CR>', { desc = 'Toggle CursorAgent', silent = true })
  vim.keymap.set('n', '<leader>sb', ':CursorAgentAdd %<CR>', { desc = 'Add current buffer to CursorAgent', silent = true })
  vim.keymap.set('v', '<leader>se', ':CursorAgentSend<CR>', { desc = 'Send visual selection to CursorAgent', silent = true })
  vim.keymap.set('n', '<leader>sr', ':CursorAgent --resume<CR>', { desc = 'Resume CursorAgent', silent = true })
end

return M
