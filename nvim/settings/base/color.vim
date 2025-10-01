augroup HighlightSettings
  autocmd!
  autocmd Colorscheme * call ColorSchemeBulkSetting()
augroup END

function! ColorSchemeBulkSetting()
  highlight IndentGuidesEven ctermbg=236 guibg=none
  highlight SuccessMsg guifg=#d8dee9 guibg=#416043
  highlight AlertMsg guifg=#d8dee9 guibg=#808113
  highlight InfoMsg gui=bold guifg=#a7f3ff guibg=none
  " diffのカラー
  highlight DiffAdd    gui=bold guifg=none guibg=#2d4235
  highlight DiffDelete gui=bold guifg=none guibg=#342023
  highlight DiffChange gui=bold guifg=none guibg=#393a2b
  highlight DiffText   gui=bold guifg=none guibg=#2f5d62
  " vim-highlightedyank
  highlight HighlightedyankRegion guibg=#626679 gui=bold

  " coc.nvim
  highlight CocErrorSign guifg=#FF888E
  highlight CocErrorHighlight guifg=none

  " easymotion
  highlight EasyMotionTarget guifg=#8CFFC5
  highlight EasyMotionTarget2First guifg=#8CFFC5
  highlight EasyMotionTarget2Second guifg=#6EC79B
  highlight EasyMotionShade guifg=#838E94
  " highlight EasyMotionMoveHL guifg=blue
  " highlight EasyMotionIncSearch ctermbg=green ctermfg=black

  " nvim-notify
  highlight NotifyERRORBorder guifg=#BA1F1F
  highlight NotifyERRORIcon guifg=#F70067
  highlight NotifyERRORTitle  guifg=#F70067

  " git-conflict
  highlight GitConflictCurrent guibg=#25374d
  highlight GitConflictIncoming guibg=#44453c
  highlight GitConflictAncestor guibg=none
  highlight GitConflictCurrentLabel guibg=#324B68
  highlight GitConflictIncomingLabel guibg=#505245
  highlight GitConflictAncestorLabel guibg=none

  " telescope
  highlight TelescopeMatching guifg=#e6e854
  highlight TelescopeBorder guifg=#54e8d4

  if g:colors_name == "iceberg"
    highlight Visual ctermbg=30 guibg=#123531
    highlight Search ctermbg=29 guifg=#ffffff guibg=#476a47
    highlight IndentGuidesOdd ctermbg=235 guibg=#1e2132
    " highlight Normal guifg=#d0c9f9

    " -----JavaScript-----
    highlight javascriptClassKeyword ctermfg=48 guifg=#1ebec9
    highlight javascriptObjectLabel ctermfg=207 guifg=#1ebec9
    highlight javascriptClassStatic ctermfg=197 guifg=#1ebec9

    " -----Ruby-----
    highlight rubyClass ctermfg=150 guifg=#1ebec9
    highlight rubyFunction ctermfg=123 guifg=#20cfdf
    highlight rubyInstanceVariable ctermfg=212 guifg=#9df6af

  elseif g:colors_name == "atom-dark"
    highlight Visual ctermbg=30 guibg=#174b45
    highlight IndentGuidesOdd ctermbg=235 guibg=#293739
  elseif g:colors_name == "material-theme"
    highlight Visual ctermbg=30 guibg=#194553
    highlight IndentGuidesOdd ctermbg=235 guibg=#37474f
  elseif g:colors_name == "nord"
    highlight Visual ctermbg=30 guibg=#314b68
    highlight IndentGuidesOdd ctermbg=235 guibg=#3b4252
  endif
endfunction

""" カラーテーマ """
colorscheme nord
