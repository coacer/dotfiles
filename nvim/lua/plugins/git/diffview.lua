-- Git diff viewer
return {
  'sindrets/diffview.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffOpen', 'DiffClose' },
  config = function()
    require('diffview').setup({})

    local diff_close_key = 'q'

    local function diff_open()
      vim.cmd('DiffviewOpen')
      vim.keymap.set('n', diff_close_key, ':DiffClose<CR>', { silent = true })
    end

    local function diff_close()
      vim.cmd('DiffviewClose')
      pcall(vim.keymap.del, 'n', diff_close_key)
    end

    vim.api.nvim_create_user_command('DiffOpen', diff_open, {})
    vim.api.nvim_create_user_command('DiffClose', diff_close, {})

    -- Override 's' key in DiffView buffers to use '<C-w>' instead of staging
    local diffview_group = vim.api.nvim_create_augroup('DiffviewKeymaps', { clear = true })
    vim.api.nvim_create_autocmd('BufWinEnter', {
      group = diffview_group,
      pattern = 'diffview://*',
      callback = function(ev)
        local bufnr = ev.buf
        -- Remove diffview.nvim's default 's' key mapping
        pcall(vim.keymap.del, 'n', 's', { buffer = bufnr })
        -- Restore global 's' -> '<C-w>' mapping
        vim.keymap.set('n', 's', '<C-w>', { buffer = bufnr, noremap = true })
      end,
    })
  end,
}
