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

    -- flash.nvim
    FlashLabel = { fg = '#2e3440', bg = '#a3be8c', bold = true }, -- 移動用ラベル（明るい緑）
    FlashMatch = { fg = '#d08770', bold = true }, -- マッチした文字（オレンジ）
    FlashCurrent = { fg = '#2e3440', bg = '#88c0d0', bold = true }, -- 現在のマッチ（青、検索と同系色だが背景付き）
    FlashBackdrop = { fg = '#4c566a' }, -- 背景の暗くなる部分

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

  if colorscheme == 'nord' then
    -- カラースキーム設定
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
