" ctrl+lでesc
" snoremapはスニペット使用時に使う
inoremap <C-l> <Esc>
cnoremap <C-l> <Esc>
vnoremap <C-l> <Esc>
snoremap <C-l> <Esc>
" ターミナルモード時にescで抜ける
tnoremap <Esc> <C-\><C-n>
tmap <C-l> <Esc>
" ctrl+lで検索ハイライト無効化+再描画
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"========== vimrc操作 ==========
" スペース+vrでnvimフォルダ(ルートディレクトリ)を開く
nnoremap <Space>vr :<C-u>edit ~/.config/nvim/<CR>
" スペース+vmでmappings.vimファイルを開く
nnoremap <Space>vm :<C-u>edit ~/.config/nvim/settings/base/mappings.vim<CR>
" スペース+vbでbasic.vimファイルを開く
nnoremap <Space>vb :<C-u>edit ~/.config/nvim/settings/base/basic.vim<CR>
" スペース+vcでcolor.vimファイルを開く
nnoremap <Space>vc :<C-u>edit ~/.config/nvim/settings/base/color.vim<CR>
" スペース+vdでdein.tomlファイルを開く
nnoremap <Space>vd :<C-u>edit ~/.config/nvim/dein/dein.toml<CR>
" スペース+vsで.vimrcファイルを読み込む
nnoremap <Space>vs :<C-u>source $MYVIMRC<CR>
" スペース+mでmyvim_manual.txtファイルを開く
nnoremap <Space>m :<C-u>edit ~/Documents/Memo/skills/Vim/myvim_manual.txt<CR>

"========== セッション操作 ==========
" スペース+swでセッションファイルを保存してウィンドウを全て閉じる
nnoremap <Space>sw :<C-u>mks! .session.vim<CR>:<C-u>qall<CR>
" スペース+ssでセッションファイルを読み込む
nnoremap <Space>ss :<C-u>source .session.vim<CR>
" スペース+sdでセッションファイルを削除
nnoremap <Space>sd :<C-u>!rm .session.vim<CR>
"==================================

" レジスタprefixをspace+r
nnoremap <Space>r "
vnoremap <Space>r "

" space+aで全選択
nnoremap <Space>a ggVG

" xで文字を消した際にレジスタに格納しない
nnoremap x "_x
vnoremap x "_x

" ウィンドウprefixをsに変換
nnoremap s <C-w>
" Yでカーソル位置から行末までコピー
nnoremap Y y$
" ctrl-spaceで下に空行挿入して元の位置に戻る
nnoremap <C-Space> mzo<Esc>"_cc<Esc>`z
" space*2でファイル全体のインデントを揃える
nnoremap <silent> <Space><Space> mz:%normal ==<CR>`zzz
" nnoremap <silent> <Space><Space> :<C-u>call CocAction("format")<CR>

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
