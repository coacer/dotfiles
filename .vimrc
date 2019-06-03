" 基本設定
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決
set noswapfile

set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=2 " 画面上でタブ文字が占める幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=2 " smartindentで増減する幅

set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト

" ctrl-h*2でカーソル上のキーワードでhelp
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>

" ESCキー2度押しでハイライトの切り替え
nnoremap <Esc><Esc> :noh<CR>

set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number " 行番号を表示
set cursorline " カーソルラインをハイライト

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
noremap j gj
noremap k gk
noremap <down> gj
noremap <up> gk

" バックスペースキーの有効化
set backspace=indent,eol,start
set showmatch " 括弧の対応関係を一瞬表示する
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

syntax on

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundle')
  call dein#begin('~/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Required:
  " ツリービュー表示
  call dein#add('scrooloose/nerdtree')
  " カラースキーム
  call dein#add('cocopon/iceberg.vim')
  " 閉じカッコ保管
  call dein#add('cohama/lexima.vim')
  " Emmet導入
  call dein#add('mattn/emmet-vim')
  " コメントアウトショートカット導入
  call dein#add('tomtom/tcomment_vim')
  " ステータスライン表示 
  call dein#add('vim-airline/vim-airline')
  " ステータスライン装飾
  call dein#add('vim-airline/vim-airline-themes')
  " git管理
  call dein#add('tpope/vim-fugitive')
  " ウィンドウサイズ変更用プラグイン
  call dein#add('simeji/winresizer')
  " カラーテーブルを表示する
  call dein#add('guns/xterm-color-table.vim')
  " JavaScriptES6のシンタックス
  call dein#add('othree/yajs.vim')
  
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

"End dein Scripts-------------------------
" The NERD Tree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-n> :<C-u>NERDTreeToggle<CR>

" ツリービュー拡張子ハイライト
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')


" ツリービュー自動表示
" autocmd VimEnter * execute 'NERDTree'

" ステータスラインカスタム
let g:airline_theme = 'bubblegum'
set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
let g:airline_section_c = '%t'
let g:airline_section_x = '%{&filetype}'
let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1
nmap <C-e> <Plug>AirlineSelectPrevTab
nmap <C-y> <Plug>AirlineSelectNextTab
map <C-d> :bd<CR>

imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

let g:indent_guides_enable_on_vim_startup = 1

" ウィンドウサイズ変更用プラグイン
" startコマンドのデフォルトctrl-eからctrl-uに変更
let g:winresizer_start_key = '<C-U>'
" 移動幅の設定
let g:winresizer_vert_resize = 3
let g:winresizer_horiz_resize = 1





"----------カラースキーム-----------
" カスタマイズ
autocmd ColorScheme * highlight Comment ctermfg=246 
autocmd ColorScheme * highlight Visual ctermbg=96 
autocmd ColorScheme * highlight Search ctermbg=96 
" -----JavaScript-----
autocmd ColorScheme * highlight javascriptClassKeyword ctermfg=48 
autocmd ColorScheme * highlight javascriptObjectLabel ctermfg=207 
autocmd ColorScheme * highlight javascriptClassStatic ctermfg=197

" -----Ruby-----
autocmd ColorScheme * highlight rubyClass ctermfg=48 
autocmd ColorScheme * highlight rubyFunction ctermfg=198 

" カラースキーム設定
colorscheme iceberg


" :SyntaxInfoコマンドでカーソル下のシンタックスグループ名を表示する関数
function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()
