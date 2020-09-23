" 基本設定
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決
set hidden " バッファ保存せずに移動しようとした場合に!をつけなくても移動できる, またargsの移動も隠しファイルにする
set undofile " undo履歴をファイルに保存(vim終了時にundo履歴が削除されない)
set undodir=~/.local/share/vim/undo " undoファイルの保存場所
" set mouse=a " マウス有効化

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
" set so=999 " 常にカーソルをファイル中央に配置
language C " 出力文字英語化
set ttimeoutlen=50 "インサートモードからEscの遅延を無くす

" LeaderをSpaceに設定
let mapleader = "\<Space>"

" スペース+vで.vimrcファイルを開く
nnoremap <Leader>v :<C-u>edit $MYVIMRC<CR>

" スペース+sで.vimrcファイルを読み込む
nnoremap <Leader>s :<C-u>source $MYVIMRC<CR>

" Yでカーソル位置から行末までコピー
nnoremap Y y$

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

" シンタックスを判別してカラー表示する
syntax enable

" Emacsキーバインディングの設定
" インサートモード
inoremap <C-b> <Left>
inoremap <C-f> <Right>

" コマンドモード
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

inoremap <C-l> <Esc>
vnoremap <C-l> <Esc>
cnoremap <C-l> <Esc>
snoremap <C-l> <Esc>
if v:version >= 801
  tnoremap <Esc> <C-\><C-n>
  tmap <C-l> <Esc>
endif
nnoremap <silent> <C-l> :<C-u>noh<CR><C-l>

" Leader+wで保存
nnoremap <Leader>w :<C-u>write<CR>
" Leader+qで閉じる(未保存のファイルがある時ダイアログ表示)
nnoremap <Leader>q :<C-u>confirm qall<CR>
" Leader+zで保存して終了
nnoremap <Leader>z :<C-u>wqall<CR>

" レジスタprefixをLeader+r
nnoremap <Leader>r "
xnoremap <Leader>r "

" <ctrl+r>*2で無名レジスタ
inoremap <C-r><C-r> <C-r>"
cnoremap <C-r><C-r> <C-r>"

" Leader+aで全選択
nnoremap <Leader>a ggVG

" xで文字を消した際にレジスタに格納しない
nnoremap x "_x
xnoremap x "_x

" ctrl+dでバッファ削除
nnoremap <silent> <C-d> :<C-u>bdelete<CR>

" *で検索時に次の検索文字に移動しないように設定
nnoremap * *N
nnoremap g* g*N

