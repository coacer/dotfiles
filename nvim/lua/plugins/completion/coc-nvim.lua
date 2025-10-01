-- LSP client plugin
return {
  'neoclide/coc.nvim',
  branch = 'release',
  build = false,
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    -- Load coc-settings.json
    local coc_settings_path = vim.g.ROOT_DIR .. '/settings/plugins/coc.rc.d/coc-settings.json'
    if vim.fn.filereadable(coc_settings_path) == 1 then
      local coc_settings_content = vim.fn.readfile(coc_settings_path)
      vim.g.coc_user_config = vim.fn.json_decode(coc_settings_content)
    end

    -- Global extensions
    vim.g.coc_global_extensions = {
      'coc-vimlsp',
      'coc-metals',
      'coc-css',
      'coc-diagnostic',
      'coc-eslint',
      -- 'coc-highlight', -- replaced by nvim-treesitter
      'coc-jest',
      'coc-json',
      'coc-neosnippet',
      'coc-phpls',
      'coc-prettier',
      'coc-solargraph',
      'coc-tsserver',
      'coc-vetur',
      'coc-cfn-lint',
      'coc-protobuf',
      'coc-flutter',
      'coc-go',
      'coc-python',
      'coc-sourcekit',
    }

    -- Basic settings
    vim.opt.backup = false
    vim.opt.writebackup = false
    vim.opt.cmdheight = 2
    vim.opt.updatetime = 300
    vim.opt.shortmess:append('c')
    vim.opt.signcolumn = 'yes'

    -- Status line integration
    vim.opt.statusline:prepend('%{coc#status()}%{get(b:,"coc_current_function","")}')

    -- Tab completion
    local function check_back_space()
      local col = vim.fn.col('.') - 1
      return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
    end

    -- Navigation mappings
    vim.keymap.set('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true })
    vim.keymap.set('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true })
    vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
    vim.keymap.set('n', 'gR', '<Plug>(coc-implementation)', { silent = true })
    vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })
    vim.keymap.set('n', 'gn', '<Plug>(coc-rename)')

    -- Documentation
    local function show_documentation()
      local filetype = vim.bo.filetype
      if filetype == 'vim' or filetype == 'help' then
        vim.cmd('h ' .. vim.fn.expand('<cword>'))
      else
        vim.fn.CocAction('doHover')
      end
    end
    vim.keymap.set('n', 'K', show_documentation, { silent = true })

    -- Auto commands
    vim.api.nvim_create_augroup('CocSettings', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      group = 'CocSettings',
      pattern = { 'typescript', 'json' },
      callback = function()
        vim.bo.formatexpr = 'CocAction("formatSelected")'
      end,
    })

    vim.api.nvim_create_autocmd('User', {
      group = 'CocSettings',
      pattern = 'CocJumpPlaceholder',
      callback = function()
        vim.fn.CocActionAsync('showSignatureHelp')
      end,
    })

    vim.api.nvim_create_autocmd('CursorHold', {
      group = 'CocSettings',
      callback = function()
        vim.fn.CocActionAsync('highlight')
      end,
    })

    -- Commands
    vim.api.nvim_create_user_command('EslintFix', function()
      vim.fn.CocCommand('eslint.executeAutofix')
    end, {})

    vim.api.nvim_create_user_command('Prettier', function()
      vim.fn.CocCommand('prettier.formatFile')
    end, {})

    -- Format on save
    local function format_on_save()
      vim.fn.CocAction('format')
    end

    vim.api.nvim_create_augroup('CocJsFormatter', { clear = true })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = 'CocJsFormatter',
      pattern = { '*.js', '*.ts', '*.tsx', '*.vue' },
      callback = format_on_save,
    })

    vim.api.nvim_create_augroup('CocGoFormatter', { clear = true })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = 'CocGoFormatter',
      pattern = '*.go',
      callback = format_on_save,
    })
  end,
}
