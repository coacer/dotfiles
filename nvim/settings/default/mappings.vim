" ctrl+lでesc
inoremap <C-l> <Esc>
cnoremap <C-l> <Esc>
vnoremap <C-l> <Esc>
tmap <C-l> <Esc>

" スペース+vでinit.vimファイルを開く
nnoremap <Space>v :<C-u>edit $MYVIMRC<CR>

" スペース+Vでdein.tomlファイルを開く
nnoremap <Space>V :<C-u>edit ~/.config/nvim/dein/dein.toml<CR>

" スペース+sで.vimrcファイルを読み込む
nnoremap <Space>s :<C-u>source $MYVIMRC<CR>

" スペース+mでmyvim_manual.txtファイルを開く
nnoremap <Space>m :<C-u>edit ~/Documents/Memo/Vim/myvim_manual.txt<CR>

" space+aで全選択
nnoremap <Space>a ggVG

" xで文字を消した際にレジスタに格納しない
nnoremap x "_x
vnoremap x "_x

" ウィンドウprefixをsに変換
nnoremap s <C-w>

" Yでカーソル位置から行末までコピー
nnoremap Y y$

" ctrl-kで下に空行挿入
nnoremap <C-k> mzo<Esc>"_cc<Esc>`z

" space*2でファイル全体のインデントを揃える
nnoremap <Space><Space> mz:%normal ==<CR>`z

" 複数行を移動
vnoremap <C-k> "zx<Up>"zP`[V`]
vnoremap <C-j> "zx"zp`[V`]

" ESCキー2度押しでハイライトの切り替え
nnoremap <Esc><Esc> :<C-u>noh<CR>

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
noremap j gj
noremap k gk
noremap <down> gj
noremap <up> gk

" Emacsキーバインディングの設定
" インサートモード
" inoremap <C-p> <Up>
" inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>

" コマンドモード
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" *で検索時に次の検索文字に移動しないように設定
nnoremap * mq*`q

" ターミナル表示時にescで抜ける
tnoremap <Esc> <C-\><C-n>

" <ctrl+r>*2で無名レジスタ
inoremap <C-r><C-r> <C-r>"
cnoremap <C-r><C-r> <C-r>"

