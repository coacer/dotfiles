" カスタマイズ
autocmd ColorScheme * highlight Visual ctermbg=30 guibg=#123531
autocmd ColorScheme * highlight Search ctermbg=29 guifg=#ffffff guibg=#476a47
autocmd ColorScheme * highlight Normal guifg=#d7d1ff
" autocmd ColorScheme * highlight Pmenu ctermfg=236 ctermbg=37

" -----JavaScript-----
autocmd ColorScheme * highlight javascriptClassKeyword ctermfg=48 guifg=#1ebec9
autocmd ColorScheme * highlight javascriptObjectLabel ctermfg=207 guifg=#1ebec9
autocmd ColorScheme * highlight javascriptClassStatic ctermfg=197 guifg=#1ebec9

" -----Ruby-----
autocmd ColorScheme * highlight rubyClass ctermfg=150 guifg=#1ebec9
autocmd ColorScheme * highlight rubyFunction ctermfg=123 guifg=#20cfdf
autocmd ColorScheme * highlight rubyInstanceVariable ctermfg=212 guifg=#9df6af

" -----PHP-----
" autocmd ColorScheme * highlight Delimiter ctermfg=37
" autocmd ColorScheme * highlight phpParent ctermfg=none
" autocmd ColorScheme * highlight Identifier ctermfg=none

" カラースキーム設定
colorscheme iceberg

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
