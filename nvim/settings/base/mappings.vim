" ctrl+lでesc
" snoremapはスニペット使用時に使う
inoremap <C-l> <Esc>
cnoremap <C-l> <C-c>
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
nnoremap <Leader>vv :<C-u>execute 'Files' g:ROOT_DIR<CR>
" スペース+vmでmappings.vimファイルを開く
nnoremap <Leader>vm :<C-u>execute 'edit' g:ROOT_DIR . '/settings/base/mappings.vim'<CR>
" スペース+vfでfunctions.vimファイルを開く
nnoremap <Leader>vf :<C-u>execute 'edit' g:ROOT_DIR . '/settings/base/functions/main.vim'<CR>
" スペース+vbでbasic.vimファイルを開く
nnoremap <Leader>vb :<C-u>execute 'edit' g:ROOT_DIR . '/settings/base/basic.vim'<CR>
" スペース+vcでcolor.vimファイルを開く
nnoremap <Leader>vc :<C-u>execute 'edit' g:ROOT_DIR . '/settings/base/color.vim'<CR>
" スペース+vdでdein.tomlファイルを開く
nnoremap <Leader>vd :<C-u>execute 'edit' g:ROOT_DIR . '/dein/dein.toml'<CR>
" スペース+vDでdein_lazy.tomlファイルを開く
nnoremap <Leader>vD :<C-u>execute 'edit' g:ROOT_DIR . '/dein/dein_lazy.toml'<CR>
" スペース+vsで.vimrcファイルを読み込む
nnoremap <Leader>vs :<C-u>source $MYVIMRC<CR>
" スペース+mでmyvim_manual.txtファイルを開く
nnoremap <Leader>m :<C-u>edit ~/Documents/Memo/skills/Vim/myvim_manual.txt<CR>

"========== セッション操作 ==========
let s:session_file = '.session.vim'
" スペース+swでセッションファイルを保存する
execute 'nnoremap <Leader>sw :<C-u>mks!' s:session_file '<CR>'
" スペース+sqでセッションファイルを保存してウィンドウを全て閉じる
execute 'nnoremap <Leader>sq :<C-u>mks!' s:session_file '<CR>:qall<CR>'
" スペース+ssでセッションファイルを読み込む
execute 'nnoremap <Leader>ss :<C-u>source' s:session_file '<CR>'
" スペース+sdでセッションファイルを削除
execute 'nnoremap <Leader>sd :<C-u>!rm' s:session_file '<CR>'
"==================================

" Leader+wで保存
nnoremap <Leader>w :<C-u>write<CR>
" Leader+qで閉じる(未保存のファイルがある時ダイアログ表示)
nnoremap <Leader>q :<C-u>confirm qall<CR>
" Leader+zで保存して終了
nnoremap <Leader>z :<C-u>wqall<CR>

" レジスタprefixをLeader+r
nnoremap <Leader>r "
xnoremap <Leader>r "

" Leader+Sでsubstituteコマンド
nnoremap <Leader>S :<C-u>%s/<C-r>///g<Left><Left>

" ctrl+hでヘルプ入力
nnoremap <C-h> :<C-u>Helptags<CR>
" +をクリップボードに保存するオペレータとする
nnoremap + "+y
nnoremap ++ "+yy
xnoremap + "+y
" オペレータ+xで現在のファイル名をクリップボードにコピー
nnoremap <silent> +x :<C-u>call system('pbcopy', expand('%:t:r'))<CR>
nnoremap <silent> +X :<C-u>call system('pbcopy', expand('%'))<CR>
" Leader+aで全選択
nnoremap <Leader>a ggVG

" xで文字を消した際にレジスタに格納しない
nnoremap x "_x
xnoremap x "_x
" gJで連結する際に連結部分の空白除去
" (デフォルトだとインデントなどされてた場合インデント分の空白を残した状態で連結するため)
nnoremap <silent> gJ mz:<C-u>+1s/^\s\+//e<CR>`zgJ
xnoremap <silent> gJ :<C-u>'<+1,'>s/^\s\+//e<CR>gvgJ
" ctrl+dでバッファ削除
nnoremap <silent> <C-d> :<C-u>bdelete<CR>
" ウィンドウprefixをsに変換
nnoremap s <C-w>
" ウィンドウ分割時にフォーカス移動
nnoremap sv <C-w>v<C-w>w
nnoremap ss <C-w>s<C-w>w
" sNでvnew
nnoremap sN :<C-u>vnew<CR>
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
nnoremap g* g*N

" <ctrl+r>*2で無名レジスタ
inoremap <C-r><C-r> <C-r>"
cnoremap <C-r><C-r> <C-r>"
tmap <C-r><C-r> <Esc>pi

" g + yankでyank範囲の末尾に移動
nnoremap gyy yy`]
xnoremap gy y`>
" gpでペースト時にカーソルを一個上の行に移動(連続ペーストの時デフォルトだと使いづらいため)
nnoremap gp gpk
" ctrl+pでその行にペースト
nmap <C-p> Vp
" 選択範囲に.コマンド実行
xnoremap <silent> . :normal .<CR>

" Float Term系(functions.vim)
" leader + ttでFloat Termを開く
nnoremap <silent> <Leader>tt :Term<CR>
" leader + tgでFloat Termでlazygitを開く
nnoremap <silent> <Leader>tg :Term lazygit<CR>
" leader + tdでFloat Termでlazydockerを開く
nnoremap <silent> <Leader>td :Term lazydocker<CR>

" GitDiffFiles(functions.vim)
nnoremap <Leader><C-G><C-G> :GitDiffStart<CR>
