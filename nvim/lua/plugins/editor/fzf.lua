-- Fuzzy finder (fzf)
return {
  'junegunn/fzf.vim',
  dependencies = { { dir = '/opt/homebrew/opt/fzf' } },
  cmd = { 'Files', 'Buffers', 'Rg', 'History', 'GGrep' },
  config = function()
    -- Layout configuration
    vim.g.fzf_layout = { window = { width = 0.8, height = 0.8 } }

    -- GGrep command
    vim.api.nvim_create_user_command('GGrep', function(opts)
      local args = opts.args
      vim.fn['fzf#vim#grep'](
        'git grep --line-number ' .. vim.fn.shellescape(args), 0,
        vim.fn['fzf#vim#with_preview']({
          dir = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
        }), opts.bang
      )
    end, { bang = true, nargs = '*' })
  end,
}
