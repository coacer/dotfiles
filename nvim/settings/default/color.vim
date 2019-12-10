" カスタマイズ

autocmd ColorScheme * highlight Comment ctermfg=246
autocmd ColorScheme * highlight Visual ctermbg=30
autocmd ColorScheme * highlight Search ctermbg=29
" autocmd ColorScheme * highlight Pmenu ctermfg=236 ctermbg=37

" -----JavaScript-----
autocmd ColorScheme * highlight javascriptClassKeyword ctermfg=48
autocmd ColorScheme * highlight javascriptObjectLabel ctermfg=207
autocmd ColorScheme * highlight javascriptClassStatic ctermfg=197

" -----Ruby-----
autocmd ColorScheme * highlight rubyClass ctermfg=150
autocmd ColorScheme * highlight rubyFunction ctermfg=123
autocmd ColorScheme * highlight rubyInstanceVariable ctermfg=212

" -----PHP-----
" autocmd ColorScheme * highlight Delimiter ctermfg=37
" autocmd ColorScheme * highlight phpParent ctermfg=none
" autocmd ColorScheme * highlight Identifier ctermfg=none

" カラースキーム設定
colorscheme iceberg

" ツリービュー拡張子ハイライト
function! NERDTreeHighlightFile(extension, fg, bg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none')
call NERDTreeHighlightFile('md',     'blue',    'none')
call NERDTreeHighlightFile('yml',    'yellow',  'none')
call NERDTreeHighlightFile('config', 'yellow',  'none')
call NERDTreeHighlightFile('conf',   'yellow',  'none')
call NERDTreeHighlightFile('json',   'yellow',  'none')
call NERDTreeHighlightFile('html',   'yellow',  'none')
call NERDTreeHighlightFile('styl',   'cyan',    'none')
call NERDTreeHighlightFile('css',    '159',    'none')
call NERDTreeHighlightFile('rb',     '169',     'none')
call NERDTreeHighlightFile('js',   '227',  'none')
call NERDTreeHighlightFile('php',    'Magenta', 'none')
call NERDTreeHighlightFile('coffee',    '79', 'none')
call NERDTreeHighlightFile('Gemfile',    '105', 'none')
call NERDTreeHighlightFile('lock',    '105', 'none')
