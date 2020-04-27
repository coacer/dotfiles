autocmd Colorscheme * call ColorSchemeBulkSetting()

function! ColorSchemeBulkSetting()
  highlight IndentGuidesEven ctermbg=236 guibg=none
  if g:colors_name == "iceberg"
    highlight Visual ctermbg=30 guibg=#123531
    highlight Search ctermbg=29 guifg=#ffffff guibg=#476a47
    highlight IndentGuidesOdd ctermbg=235 guibg=#1e2132
    highlight Normal guifg=#d0c9f9

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
  endif
endfunction

" ツリービュー拡張子ハイライト
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'none',  'none', '#26b5a2',  'none')
call NERDTreeHighlightFile('md',     'none',    'none', '#ddd', 'none')
call NERDTreeHighlightFile('yml',    'none',  'none', '#acaeae',  'none')
call NERDTreeHighlightFile('config', 'none',  'none', '#acaeae',  'none')
call NERDTreeHighlightFile('conf',   'none',  'none', '#acaeae',  'none')
call NERDTreeHighlightFile('json',   'none',  'none', '#faff7f',  'none')
call NERDTreeHighlightFile('html',   'none',  'none', '#799cff',  'none')
call NERDTreeHighlightFile('styl',   'cyan',    'none', '#1de1e1',    'none')
call NERDTreeHighlightFile('css',    'cyan',    'none', '#1de1e1',    'none')
call NERDTreeHighlightFile('rb',     'Red',     'none', '#fc8391',     'none')
call NERDTreeHighlightFile('js',   '227',  'none', '#faff7f', 'none')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#d32eff', 'none')
call NERDTreeHighlightFile('vue',    'Green',   'none', '#68ffbf', 'none')
call NERDTreeHighlightFile('coffee',    '79', 'none', '#fda855', 'none')
call NERDTreeHighlightFile('Gemfile',    '105', 'none', '#fc8391', 'none')
call NERDTreeHighlightFile('Rakefile',    '105', 'none', '#fc8391', 'none')
call NERDTreeHighlightFile('lock',    '105', 'none', '#a9abab', 'none')
call NERDTreeHighlightFile('ts',    '105', 'none', '#72dfc5', 'none')
call NERDTreeHighlightFile('tsx',    '105', 'none', '#72dfc5', 'none')

" カラースキーム設定
" colorscheme iceberg
colorscheme atom-dark
" colorscheme material-theme
" ランダムにカラースキームを決定
function! ColorSchemeRand() abort
  let l:color_schemes = ['iceberg', 'atom-dark', 'material-theme']
  let l:match_end = matchend(reltimestr(reltime()), '\d\+\.') + 1
  let l:rand = reltimestr(reltime())[l:match_end : ] % len(l:color_schemes)
  execute "colorscheme " . l:color_schemes[l:rand]
endfunction

" autocmd! VimEnter * call ColorSchemeRand()
