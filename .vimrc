" 基本設定
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決
set noswapfile
" set mouse=a " マウスクリックを有効か
set hidden " バッファ保存せずに移動しようとした場合に!をつけなくても移動できる, またargsの移動も隠しファイルにする

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

" スペース+vで.vimrcファイルを開く
nnoremap <Space>v :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>V :<C-u>vsplit $MYVIMRC<CR>

" スペース+sで.vimrcファイルを読み込む
nnoremap <Space>s :<C-u>source $MYVIMRC<CR>

" スペース+mでmyvim_manual.txtファイルを開く
nnoremap <Space>m :<C-u>vsplit ~/Memo/myvim_manual.txt<CR>

" ctrl+aで全選択
nnoremap <Space>a ggVG

" ; と : を入れ替える
" noremap ; :
" noremap : ;

" x, cで文字を消した際にレジスタに格納しない
nnoremap x "_x
" nnoremap c "_c
vnoremap x "_x
" vnoremap c "_c

" ctrl-oで下に空行挿入
nnoremap <C-o> mzo<Esc>"_cc<Esc>`z

" 行を移動
nnoremap <C-k> "zdd<Up>"zP
nnoremap <C-j> "zdd"zp
" 複数行を移動
vnoremap <C-k> "zx<Up>"zP`[V`]
vnoremap <C-j> "zx"zp`[V`]

" ctrl-h*2でカーソル上のキーワードでhelp
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>

" ESCキー2度押しでハイライトの切り替え
nnoremap <Esc><Esc> :noh<CR>

" set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
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

" シンタックスを判別してカラー表示する
syntax on

" Emacs風キーバインディングの設定
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


" 補完機能
" inoremap <Space><Space> <C-n>

" ctrl+y -/= でerbのカッコを表示
inoremap <C-y>- <%  %><Left><Left><Left>
inoremap <C-y>= <%=  %><Left><Left><Left>

" *で検索時に次の検索文字に移動しないように設定
nnoremap * mq*`q

" space + t でtigを開く
nnoremap <Space>t :!tig<CR>


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundle')
  call dein#begin('~/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

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
  " ウィンドウサイズ変更用プラグイン
  call dein#add('simeji/winresizer')
  " カラーテーブルを表示する
  call dein#add('guns/xterm-color-table.vim')
  " JavaScriptES6のシンタックス
  call dein#add('othree/yajs.vim')
  " vim上からgitコマンドを使えるプラグイン
  call dein#add('tpope/vim-fugitive')
  " カッコやHTMLタグなどの挿入、削除、置換プラグイン
  call dein#add('tpope/vim-surround')
  " rails用プラグイン
  call dein#add('tpope/vim-rails')
  " vim help日本語化
  call dein#add('vim-jp/vimdoc-ja')
  " インデントを可視化
  call dein#add('nathanaelkane/vim-indent-guides')
  " nerdtreeにアイコン表示
  call dein#add('ryanoasis/vim-devicons')
  " 末尾の空白可視化j
  call dein#add('bronson/vim-trailing-whitespace')
  " ファイルオープンを便利に
  call dein#add('Shougo/unite.vim')
  " Unite.vimで最近使ったファイルを表示できるようにする
  call dein#add('Shougo/neomru.vim')
  " シンタックスエラーチェック
  call dein#add('w0rp/ale')
  " gitで管理してる変更された箇所を行番号横に表示
  call dein#add('airblade/vim-gitgutter')
  " surround.vimなどの変更を.で繰り返し可能にする
  call dein#add('tpope/vim-repeat')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------





" -------------- The NERD Tree----------------
" 基本設定
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
noremap <C-n> :<C-u>NERDTreeToggle<CR>
" フォルダアイコンの表示をON
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" ツリービュー自動表示
" autocmd VimEnter * execute 'NERDTree'

" ツリービュー拡張子ハイライト
function! NERDTreeHighlightFile(extension, fg, bg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none')
call NERDTreeHighlightFile('md',     'blue',    'none')
call NERDTreeHighlightFile('yml',    'yellow',  'none')
call NERDTreeHighlightFile('config', 'yellow',  'none')
call NERDTreeHighlightFile('conf',   'yellow',  'none')
call NERDTreeHighlightFile('json',   'yellow',  'none')
call NERDTreeHighlightFile('html',   'yellow',  'none')
call NERDTreeHighlightFile('styl',   'cyan',    'none')
call NERDTreeHighlightFile('css',    '159',    'none')
call NERDTreeHighlightFile('rb',     '169',     'none')
call NERDTreeHighlightFile('js',   '227',  'none')
call NERDTreeHighlightFile('php',    'Magenta', 'none')
call NERDTreeHighlightFile('coffee',    '79', 'none')
call NERDTreeHighlightFile('Gemfile',    '105', 'none')
call NERDTreeHighlightFile('lock',    '105', 'none')


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
noremap <C-d> :bd<CR>



let g:indent_guides_enable_on_vim_startup = 1

" ウィンドウサイズ変更用プラグイン(winresizer)
" startコマンドのデフォルトctrl-eからctrl-uに変更
let g:winresizer_start_key = '<C-U>'
" 移動幅の設定
let g:winresizer_vert_resize = 3
let g:winresizer_horiz_resize = 1





"----------カラースキーム-----------
" カスタマイズ

autocmd ColorScheme * highlight Comment ctermfg=246
autocmd ColorScheme * highlight Visual ctermbg=29
autocmd ColorScheme * highlight Search ctermbg=29
" -----JavaScript-----
autocmd ColorScheme * highlight javascriptClassKeyword ctermfg=48
autocmd ColorScheme * highlight javascriptObjectLabel ctermfg=207
autocmd ColorScheme * highlight javascriptClassStatic ctermfg=197

" -----Ruby-----
autocmd ColorScheme * highlight rubyClass ctermfg=150
autocmd ColorScheme * highlight rubyFunction ctermfg=123
autocmd ColorScheme * highlight rubyInstanceVariable ctermfg=212

" -----PHP-----
" autocmd ColorScheme * highlight Delimiter ctermfg=37
" autocmd ColorScheme * highlight phpParent ctermfg=none
" autocmd ColorScheme * highlight Identifier ctermfg=none

" -----インデント-----
let g:indent_guides_auto_colors = 0
autocmd Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd Colorscheme * :hi IndentGuidesEven ctermbg=236


" カラースキーム設定
colorscheme iceberg


" :SyntaxInfoコマンドでカーソル下のシンタックスグループ名を表示する関数
function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction

command! SyntaxInfo call s:get_syn_info()

let g:ctrlp_match_window = 'order:ttb,min:20,max:20,results:100' " マッチウインドウの設定. 「下部に表示, 大きさ20行で固定, 検索結果100件」
let g:ctrlp_show_hidden = 1 " .(ドット)から始まるファイルも検索対象にする
let g:ctrlp_types = ['fil'] "ファイル検索のみ使用
let g:ctrlp_extensions = ['funky', 'commandline'] " CtrlPの拡張として「funky」と「commandline」を使用

" CtrlPCommandLineの有効化
command! CtrlPCommandLine call ctrlp#init(ctrlp#commandline#id())

" CtrlPFunkyの有効化
let g:ctrlp_funky_matchtype = 'path'
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <Space>F :Unite buffer<CR>
" 再帰的にファイル一覧検索
noremap <Space>f :Unite file_rec<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
" noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> s unite#do_action('split')
" au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> v unite#do_action('vsplit')
" au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
" au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
" au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""
" ale設定
let g:ale_sign_error = '✖︎'
let g:ale_sign_warning = '⚠︎'
