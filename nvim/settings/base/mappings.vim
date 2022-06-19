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
tmap <C-l> <Esc>
" ctrl+lで検索ハイライト無効化+再描画
nnoremap <silent> <C-l> <Cmd>nohlsearch<CR><C-l>

"========== vimrc操作 ==========
" スペース+vvでnvimフォルダをfzfで開く
nnoremap <Leader>vv <Cmd>execute 'Files' g:ROOT_DIR<CR>
" スペース+vmでmappings.vimファイルを開く
nnoremap <Leader>vm <Cmd>execute 'edit' g:ROOT_DIR . '/settings/base/mappings.vim'<CR>
" スペース+vfでfunctions.vimファイルを開く
nnoremap <Leader>vf <Cmd>execute 'edit' g:ROOT_DIR . '/settings/base/functions/main.vim'<CR>
" スペース+vbでbasic.vimファイルを開く
nnoremap <Leader>vb <Cmd>execute 'edit' g:ROOT_DIR . '/settings/base/basic.vim'<CR>
" スペース+vcでcolor.vimファイルを開く
nnoremap <Leader>vc <Cmd>execute 'edit' g:ROOT_DIR . '/settings/base/color.vim'<CR>
" スペース+vdでdein.tomlファイルを開く
nnoremap <Leader>vd <Cmd>execute 'edit' g:ROOT_DIR . '/dein/dein.toml'<CR>
" スペース+vDでdein_lazy.tomlファイルを開く
nnoremap <Leader>vD <Cmd>execute 'edit' g:ROOT_DIR . '/dein/dein_lazy.toml'<CR>
" スペース+vsで.vimrcファイルを読み込む
nnoremap <Leader>vs <Cmd>source $MYVIMRC<CR>
" スペース+mでmyvim_manual.txtファイルを開く
nnoremap <Leader>m <Cmd>edit ~/Documents/Memo/skills/Vim/myvim_manual.txt<CR>

"========== セッション操作 ==========
let s:session_file = '.session.vim'
" スペース+swでセッションファイルを保存する
execute 'nnoremap <Leader>sw <Cmd>mks!' s:session_file '<CR>'
" スペース+sqでセッションファイルを保存してウィンドウを全て閉じる
execute 'nnoremap <Leader>sq <Cmd>mks!' s:session_file '<CR>:qall<CR>'
" スペース+ssでセッションファイルを読み込む
execute 'nnoremap <Leader>ss <Cmd>source' s:session_file '<CR>'
" スペース+sdでセッションファイルを削除
execute 'nnoremap <Leader>sd <Cmd>!rm' s:session_file '<CR>'
"==================================

" Leader+wで保存
nnoremap <Leader>w <Cmd>write<CR>
" Leader+qで閉じる(未保存のファイルがある時ダイアログ表示)
nnoremap <Leader>q <Cmd>confirm qall<CR>
" Leader+zで保存して終了
nnoremap <Leader>z <Cmd>wqall<CR>

" レジスタprefixをLeader+r
nnoremap <Leader>r "
xnoremap <Leader>r "

" Leader+Sでsubstituteコマンド
nnoremap <Leader>S :%s/<C-r>///g<Left><Left>

" +をクリップボードに保存するオペレータとする
nnoremap + "+y
nnoremap ++ "+yy
xnoremap + "+y
" オペレータ+xで現在のファイル名をクリップボードにコピー
nnoremap <silent> +x <Cmd>call system('pbcopy', expand('%:t:r'))<CR>
nnoremap <silent> +X <Cmd>call system('pbcopy', expand('%'))<CR>
" Leader+aで全選択
nnoremap <Leader>a ggVG

" xで文字を消した際にレジスタに格納しない
nnoremap x "_x
xnoremap x "_x
" gJで連結する際に連結部分の空白除去
" (デフォルトだとインデントなどされてた場合インデント分の空白を残した状態で連結するため)
nnoremap <silent> gJ mz:<C-u>+1s/^\s\+//e<CR>`zgJ
xnoremap <silent> gJ <Cmd>'<+1,'>s/^\s\+//e<CR>gvgJ
" ctrl+dでバッファ削除
nnoremap <silent> <C-d> <Cmd>bdelete<CR>
" ウィンドウprefixをsに変換
nnoremap s <C-w>
" ウィンドウ分割時にフォーカス移動
nnoremap sv <C-w>v<C-w>w
nnoremap ss <C-w>s<C-w>w
" sNでvnew
nnoremap sN <Cmd>vnew<CR>
" Yでカーソル位置から行末までコピー
nnoremap Y y$
" ctrl-j/kで上下に空行挿入して元の位置に戻る
" o/Oだけだとコメント行にカーソルが乗っていたとき空行がコメントになってしまうためccで回避
nnoremap <C-j> mzo<Esc>"_cc<Esc>`z
nnoremap <C-k> mzO<Esc>"_cc<Esc>`z
" Leader*2でファイル全体のインデントを揃える
nnoremap <silent> <Leader><Leader> mz:%normal ==<CR>`zzz
" nnoremap <silent> <Leader><Leader> <Cmd>call CocAction("format")<CR>

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

cnoremap <C-k> \/

" *で検索時に次の検索文字に移動しないように設定
" nnoremap * *N
" nnoremap g* g*N

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
" leader + ttでTermを開く
" nnoremap <silent> <Leader>tt :Term<CR>
nnoremap <silent> <Leader>tt :TermFloat -<CR>
" leader + tgでFloat Termでlazygitを開く
nnoremap <silent> <Leader>tg :TermFloat lazygit<CR>
" leader + tdでFloat Termでlazydockerを開く
nnoremap <silent> <Leader>td :TermFloat lazydocker<CR>

" diffview
nnoremap <Leader><C-G><C-G> :DiffOpen<CR>

" hlslensにバグがあるため
nnoremap n /<CR>

