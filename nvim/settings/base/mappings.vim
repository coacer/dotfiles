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
" ctrl+lでctrl+c
tmap <C-l> <C-c>
" ctrl+lで検索ハイライト無効化+再描画
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"========== vimrc操作 ==========
" スペース+vvでnvimフォルダをfzfで開く
nnoremap <Leader>vv :<C-u>execute 'Files' g:root_dir<CR>
" スペース+vmでmappings.vimファイルを開く
nnoremap <Leader>vm :<C-u>execute 'edit' g:root_dir . '/settings/base/mappings.vim'<CR>
" スペース+vfでfunctions.vimファイルを開く
nnoremap <Leader>vf :<C-u>execute 'edit' g:root_dir . '/settings/base/functions.vim'<CR>
" スペース+vbでbasic.vimファイルを開く
nnoremap <Leader>vb :<C-u>execute 'edit' g:root_dir . '/settings/base/basic.vim'<CR>
" スペース+vcでcolor.vimファイルを開く
nnoremap <Leader>vc :<C-u>execute 'edit' g:root_dir . '/settings/base/color.vim'<CR>
" スペース+vdでdein.tomlファイルを開く
nnoremap <Leader>vd :<C-u>execute 'edit' g:root_dir . '/dein/dein.toml'<CR>
" スペース+vDでdein_lazy.tomlファイルを開く
nnoremap <Leader>vD :<C-u>execute 'edit' g:root_dir . '/dein/dein_lazy.toml'<CR>
" スペース+vsで.vimrcファイルを読み込む
nnoremap <Leader>vs :<C-u>source $MYVIMRC<CR>
" スペース+mでmyvim_manual.txtファイルを開く
nnoremap <Leader>m :<C-u>edit ~/Documents/Memo/skills/Vim/myvim_manual.txt<CR>

"========== セッション操作 ==========
" スペース+swでセッションファイルを保存する
nnoremap <Leader>sw :<C-u>mks! .session.vim<CR>
" スペース+sWでセッションファイルを保存してウィンドウを全て閉じる
nnoremap <Leader>sW :<C-u>mks! .session.vim<CR>:<C-u>qall<CR>
" スペース+ssでセッションファイルを読み込む
nnoremap <Leader>ss :<C-u>source .session.vim<CR>
" スペース+sdでセッションファイルを削除
nnoremap <Leader>sd :<C-u>!rm .session.vim<CR>
"==================================

" Leader+wで保存
nnoremap <Leader>w :<C-u>write<CR>
" Leader+qで閉じる(未保存のファイルがある時ダイアログ表示)
nnoremap <Leader>q :<C-u>confirm qall<CR>
" Leader+zで保存して終了
nnoremap <Leader>z :<C-u>wqall<CR>

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
" gJで連結する際に連結部分の空白除去
" (デフォルトだとインデントなどされてた場合インデント分の空白を残した状態で連結するため)
nnoremap <silent> gJ mz:<C-u>+1s/^\s\+//e<CR>`zgJ
vnoremap <silent> gJ :<C-u>'<+1,'>s/^\s\+//e<CR>gvgJ

" ウィンドウprefixをsに変換
nnoremap s <C-w>
" ウィンドウ分割時にフォーカス移動
nnoremap sv <C-w>v<C-w>w
nnoremap ss <C-w>s<C-w>w
" Yでカーソル位置から行末までコピー
nnoremap Y y$
" ctrl-j/kで上下に空行挿入して元の位置に戻る
" o/Oだけだとコメント行にカーソルが乗っていたとき空行がコメントになってしまうためccで回避
nnoremap <C-j> mzo<Esc>"_cc<Esc>`z
nnoremap <C-k> mzO<Esc>"_cc<Esc>`z
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
nnoremap * *N

" <ctrl+r>*2で無名レジスタ
inoremap <C-r><C-r> <C-r>"
cnoremap <C-r><C-r> <C-r>"

" ヴィジュアルモードでgyでyankしたらyank範囲の末尾にカーソル移動
vnoremap gy y`>
" gpでペースト時にカーソルを一個上の行に移動(連続ペーストの時デフォルトだと使いづらいため)
nnoremap gp gpk
" 選択範囲に.コマンド実行
vnoremap <silent> . :normal .<CR>

" Float Term系(functions.vim)
" leader + ttでFloat Termを開く
nnoremap <silent> <Leader>tt :Term<CR>
" leader + tgでFloat Termでlazygitを開く
nnoremap <silent> <Leader>tg :Term lazygit<CR>
" leader + tdでFloat Termでlazydockerを開く
nnoremap <silent> <Leader>td :Term lazydocker<CR>

" GitStatusDiff(functions.vim)
nnoremap <Leader><C-G><C-G> :GitStatusDiff<CR>
