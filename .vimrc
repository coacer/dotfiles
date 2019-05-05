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
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

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
set runtimepath+=/Users/nakagamiyuki/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/nakagamiyuki/.vim/bundle')
  call dein#begin('/Users/nakagamiyuki/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/nakagamiyuki/.vim/bundle/repos/github.com/Shougo/dein.vim')

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
  
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
" icebergを有効にする場合この下のコメントアウトを外す
colorscheme iceberg
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
" The NERD Tree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-n> :<C-u>NERDTreeToggle<CR>

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
