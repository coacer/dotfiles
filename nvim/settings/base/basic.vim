" ダイナミック プロバイダのパス
let g:python_host_prog  = '~/.pyenv/versions/py2neovim/bin/python'
let g:python3_host_prog = '~/.pyenv/versions/py3neovim/bin/python'
let g:ruby_host_prog = '~/.rbenv/versions/2.6.0/bin/neovim-ruby-host'
let g:node_host_prog = '~/.nodenv/versions/12.16.1/bin/neovim-node-host'

" neovimデフォルト有効オプション
" syntax on " シンタックスを判別してカラー表示する
" filetype plugin indent on " ファイルタイプに応じてインデントを有効化する
" set autoindent " 改行時に前の行のインデントを継続する
" set autoread " vimで開いているファイルが外部で編集された時に自動で読み直す
" set backspace=indent,eol,start " バックスペースキーの有効化
" set encoding=utf-8
" set hlsearch " 検索結果をハイライト
" set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
" set showcmd " 右下にコマンドが表示される
" 基本設定
scriptencoding utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解(エミュレータにも依存するためぶっちゃけ役に立ってない)
set hidden " バッファ保存せずに移動しようとした場合に!をつけなくても移動できる, またargsの移動も隠しファイルにする
set undofile " undo履歴をファイルに保存(vim終了時にundo履歴が削除されない)
" set noswapfile
" set mouse=a " マウス有効化
set termguicolors
lang en_US.UTF-8
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=2 " 画面上でタブ文字が占める幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=2 " smartindentで増減する幅

set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
" language C " 出力文字英語化
set inccommand=split "文字列置換をインタラクティブに
set ttimeoutlen=50 "インサートモードからEscの遅延を無くす

" set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number " 行番号を表示
set cursorline " カーソルラインをハイライト
set foldmethod=indent " foldmethodをインデントにする

set showmatch " 括弧の対応関係を一瞬表示する
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

" ターミナル表示時は番号を表示しない
autocmd TermOpen * setlocal nonumber
" 保存時に末尾のスペースを削除
autocmd BufWritePre * %s/\s\+$//e
" ファイル表示時にfoldを全て展開
autocmd BufRead * normal zR
