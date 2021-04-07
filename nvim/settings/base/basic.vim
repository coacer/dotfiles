" command line mode で使用するシェル(alias読み込みするため)
" let &shell='/bin/zsh -i'

" neovimデフォルト有効オプション
if !has('nvim')
  syntax enable " シンタックスを判別してカラー表示する
  filetype plugin indent on " ファイルタイプに応じてインデントを有効化する
  set autoindent " 改行時に前の行のインデントを継続する
  set autoread " vimで開いているファイルが外部で編集された時に自動で読み直す
  set backspace=indent,eol,start " バックスペースキーの有効化
  set encoding=utf-8
  set hlsearch " 検索結果をハイライト
  set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
  set showcmd " 右下にコマンドが表示される
endif
" 基本設定
scriptencoding utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set hidden " バッファ保存せずに移動しようとした場合に!をつけなくても移動できる, またargsの移動も隠しファイルにする
set undofile " undo履歴をファイルに保存(vim終了時にundo履歴が削除されない)
" set mouse=a " マウス有効化
set termguicolors
set pumblend=40 " ポップアップメニューの透明度を設定
set winblend=30 " floating windowsの透明度を設定
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
set virtualedit=block " 矩形選択でテキストが存在しない箇所も選択出来る

" set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number " 行番号を表示

" 画面描画が重いのでオフに
" set relativenumber " 相対行番号を表示
" set cursorline " カーソルラインをハイライト

" set foldmethod=syntax " foldmethodをインデントにする

set showmatch " 括弧の対応関係を一瞬表示する
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する
set nofixendofline " 保存時に自動でファイル末尾に改行が入らない(vimはデフォルトで改行を入れるため)
set regexpengine=1 "@see https://github.com/vim/vim/issues/2712#issuecomment-372968129

augroup Basic
  autocmd!
  " ターミナル表示時は番号を表示しない
  autocmd TermOpen * setlocal nonumber
  au BufNewFile,BufRead *.vtl set ft=velocity
  " 保存時に末尾の半角/全角スペースを削除
  " autocmd BufWritePre * %s/\v(\s|　)+$//e
  " ファイル表示時にfoldを全て展開
  " autocmd BufRead * normal zR
augroup END
