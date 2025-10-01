local M = {}

-- カラースキームごとのハイライト設定
function M.setup_highlights()
  local highlights = {
    -- 共通設定
    IndentGuidesEven = { ctermbg = 236 },
    SuccessMsg = { fg = '#d8dee9', bg = '#416043' },
    AlertMsg = { fg = '#d8dee9', bg = '#808113' },
    InfoMsg = { bold = true, fg = '#a7f3ff' },

    -- diffのカラー
    DiffAdd = { bold = true, bg = '#2d4235' },
    DiffDelete = { bold = true, bg = '#342023' },
    DiffChange = { bold = true, bg = '#393a2b' },
    DiffText = { bold = true, bg = '#2f5d62' },

    -- vim-highlightedyank
    HighlightedyankRegion = { bg = '#626679', bold = true },

    -- coc.nvim
    CocErrorSign = { fg = '#FF888E' },
    CocErrorHighlight = {},

    -- easymotion
    EasyMotionTarget = { fg = '#8CFFC5' },
    EasyMotionTarget2First = { fg = '#8CFFC5' },
    EasyMotionTarget2Second = { fg = '#6EC79B' },
    EasyMotionShade = { fg = '#838E94' },

    -- nvim-notify
    NotifyERRORBorder = { fg = '#BA1F1F' },
    NotifyERRORIcon = { fg = '#F70067' },
    NotifyERRORTitle = { fg = '#F70067' },

    -- git-conflict
    GitConflictCurrent = { bg = '#25374d' },
    GitConflictIncoming = { bg = '#44453c' },
    GitConflictAncestor = {},
    GitConflictCurrentLabel = { bg = '#324B68' },
    GitConflictIncomingLabel = { bg = '#505245' },
    GitConflictAncestorLabel = {},

    -- telescope
    TelescopeMatching = { fg = '#e6e854' },
    TelescopeBorder = { fg = '#54e8d4' },
  }

  -- 共通ハイライトを適用
  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- カラースキーム別の設定
  local colorscheme = vim.g.colors_name

  if colorscheme == 'iceberg' then
    vim.api.nvim_set_hl(0, 'Visual', { ctermbg = 30, bg = '#123531' })
    vim.api.nvim_set_hl(0, 'Search', { ctermbg = 29, fg = '#ffffff', bg = '#476a47' })
    vim.api.nvim_set_hl(0, 'IndentGuidesOdd', { ctermbg = 235, bg = '#1e2132' })

    -- JavaScript
    vim.api.nvim_set_hl(0, 'javascriptClassKeyword', { ctermfg = 48, fg = '#1ebec9' })
    vim.api.nvim_set_hl(0, 'javascriptObjectLabel', { ctermfg = 207, fg = '#1ebec9' })
    vim.api.nvim_set_hl(0, 'javascriptClassStatic', { ctermfg = 197, fg = '#1ebec9' })

    -- Ruby
    vim.api.nvim_set_hl(0, 'rubyClass', { ctermfg = 150, fg = '#1ebec9' })
    vim.api.nvim_set_hl(0, 'rubyFunction', { ctermfg = 123, fg = '#20cfdf' })
    vim.api.nvim_set_hl(0, 'rubyInstanceVariable', { ctermfg = 212, fg = '#9df6af' })

  elseif colorscheme == 'atom-dark' then
    vim.api.nvim_set_hl(0, 'Visual', { ctermbg = 30, bg = '#174b45' })
    vim.api.nvim_set_hl(0, 'IndentGuidesOdd', { ctermbg = 235, bg = '#293739' })

  elseif colorscheme == 'material-theme' then
    vim.api.nvim_set_hl(0, 'Visual', { ctermbg = 30, bg = '#194553' })
    vim.api.nvim_set_hl(0, 'IndentGuidesOdd', { ctermbg = 235, bg = '#37474f' })

  elseif colorscheme == 'nord' then
    vim.api.nvim_set_hl(0, 'Visual', { ctermbg = 30, bg = '#314b68' })
    vim.api.nvim_set_hl(0, 'IndentGuidesOdd', { ctermbg = 235, bg = '#3b4252' })
  end
end

-- autocmdでColorscheme後にハイライトを適用
function M.setup()
  local highlight_group = vim.api.nvim_create_augroup('HighlightSettings', { clear = true })

  vim.api.nvim_create_autocmd('ColorScheme', {
    group = highlight_group,
    pattern = '*',
    callback = function()
      M.setup_highlights()
    end,
  })

  vim.cmd.colorscheme('nord')
end

M.setup()
