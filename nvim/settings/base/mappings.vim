" LeaderをSpaceに設定
let mapleader = "\<Space>"
" ctrl+lでesc
" snoremapはスニペット使用時に使う
inoremap <C-l> <Esc>
cnoremap <C-l> <Esc>
vnoremap <C-l> <Esc>
snoremap <C-l> <Esc>
onoremap <C-l> <Esc>
lnoremap <C-l> <Esc>
" ターミナルモード時にescで抜ける
tnoremap <Esc> <C-\><C-n>
tmap <C-l> <Esc>
" ctrl+lで検索ハイライト無効化+再描画
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"========== vimrc操作 ==========
" スペース+vrでnvimフォルダ(ルートディレクトリ)を開く
nnoremap <Leader>vr :<C-u>edit ~/.config/nvim/<CR>
" スペース+vmでmappings.vimファイルを開く
nnoremap <Leader>vm :<C-u>edit ~/.config/nvim/settings/base/mappings.vim<CR>
" スペース+vbでbasic.vimファイルを開く
nnoremap <Leader>vb :<C-u>edit ~/.config/nvim/settings/base/basic.vim<CR>
" スペース+vcでcolor.vimファイルを開く
nnoremap <Leader>vc :<C-u>edit ~/.config/nvim/settings/base/color.vim<CR>
" スペース+vdでdein.tomlファイルを開く
nnoremap <Leader>vd :<C-u>edit ~/.config/nvim/dein/dein.toml<CR>
" スペース+vsで.vimrcファイルを読み込む
nnoremap <Leader>vs :<C-u>source $MYVIMRC<CR>
" スペース+mでmyvim_manual.txtファイルを開く
nnoremap <Leader>m :<C-u>edit ~/Documents/Memo/skills/Vim/myvim_manual.txt<CR>

"========== セッション操作 ==========
" スペース+swでセッションファイルを保存してウィンドウを全て閉じる
nnoremap <Leader>sw :<C-u>mks! .session.vim<CR>:<C-u>qall<CR>
" スペース+ssでセッションファイルを読み込む
nnoremap <Leader>ss :<C-u>source .session.vim<CR>
" スペース+sdでセッションファイルを削除
nnoremap <Leader>sd :<C-u>!rm .session.vim<CR>
"==================================

" レジスタprefixをLeader+r
nnoremap <Leader>r "
vnoremap <Leader>r "
" ヴィジュアルモードで+でシステムクリップボードにyank
vnoremap + "+y
" Leader+aで全選択
nnoremap <Leader>a ggVG

" xで文字を消した際にレジスタに格納しない
nnoremap x "_x
vnoremap x "_x

" ウィンドウprefixをsに変換
nnoremap s <C-w>
" Yでカーソル位置から行末までコピー
nnoremap Y y$
" ctrl-spaceで下に空行挿入して元の位置に戻る
nnoremap <C-Space> mzo<Esc>"_cc<Esc>`z
" Leader*2でファイル全体のインデントを揃える
nnoremap <silent> <Leader><Leader> mz:%normal ==<CR>`zzz
" nnoremap <silent> <Leader><Leader> :<C-u>call CocAction("format")<CR>

" 論理行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap ^ g^
nnoremap $ g$

" Emacsキーバインディングの設定
" インサートモード
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>

" コマンドモード
" ctrl+n/pはデフォルトで履歴を辿れるがフィルタリング機能が<up>, <down>にしかないので追加
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" *で検索時に次の検索文字に移動しないように設定
nnoremap * mq*`q

" <ctrl+r>*2で無名レジスタ
inoremap <C-r><C-r> <C-r>"
cnoremap <C-r><C-r> <C-r>"

" ヴィジュアルモードでgyでyankしたらyank範囲の末尾にカーソル移動
vnoremap gy y`>
" gpでペースト時にカーソルを一個上の行に移動(連続ペーストの時デフォルトだと使いづらいため)
nnoremap gp gpk
