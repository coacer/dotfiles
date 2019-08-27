" 基本設定
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決
set noswapfile
set hidden " バッファ保存せずに移動しようとした場合に!をつけなくても移動できる, またargsの移動も隠しファイルにする
set undofile " undo履歴をファイルに保存(vim終了時にundo履歴が削除されない)

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
set inccommand=split "文字列置換をインタラクティブに
set ttimeoutlen=50 "インサートモードからEscの遅延を無くす

" スペース+vで.vimrcファイルを開く
nnoremap <Space>v :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>V :<C-u>vsplit $MYVIMRC<CR>

" スペース+sで.vimrcファイルを読み込む
nnoremap <Space>s :<C-u>source $MYVIMRC<CR>

" スペース+mでmyvim_manual.txtファイルを開く
nnoremap <Space>m :<C-u>vsplit ~/Memo/myvim_manual.txt<CR>

" space+aでj選択
nnoremap <Space>a ggVG

" xで文字を消した際にレジスタに格納しない
nnoremap x "_x
vnoremap x "_x

" スペースEnterで下に空行挿入
nnoremap <Space><CR> mzo<Esc>"_cc<Esc>`z

" 行を移動
nnoremap <C-k> "zdd<Up>"zP
nnoremap <C-j> "zdd"zp
" 複数行を移動
vnoremap <C-k> "zx<Up>"zP`[V`]
vnoremap <C-j> "zx"zp`[V`]

" ESCキー2度押しでハイライトの切り替え
nnoremap <Esc><Esc> :<C-u>noh<CR>

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

" ctrl+y -/= でerbのカッコを表示
inoremap <C-y>- <%  %><Left><Left><Left>
inoremap <C-y>= <%=  %><Left><Left><Left>

" *で検索時に次の検索文字に移動しないように設定
nnoremap * mq*`q

" space + t でtigを開く
nnoremap <Space>t :<C-u>!tig<CR>

" ターミナル表示時にescで抜ける
tnoremap <Esc> <C-\><C-n>

" <ctrl+r>*2で無名レジスタ
inoremap <C-r><C-r> <C-r>"
cnoremap <C-r><C-r> <C-r>"


"dein Scripts-----------------------------
" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

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
  " 末尾の空白可視化
  call dein#add('bronson/vim-trailing-whitespace')
  " シンタックスエラーチェック
  call dein#add('w0rp/ale')
  " gitで管理してる変更された箇所を行番号横に表示
  call dein#add('airblade/vim-gitgutter')
  " surround.vimなどの変更を.で繰り返し可能にする
  call dein#add('tpope/vim-repeat')
  " ファイル検索プラグイン
  call dein#add('Shougo/denite.nvim')
  " denite.nvim用
  " call dein#add('roxma/nvim-yarp')
  " denite.nvim用
  " call dein#add('roxma/vim-hug-neovim-rpc')
  " スクロールを滑らかに
  call dein#add('yuttie/comfortable-motion.vim')
  " 非同期補完
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  " coffeescriptシンタックス
  call dein#add('kchmck/vim-coffee-script')
  " gundoグラフ可視化
  call dein#add('sjl/gundo.vim')
  " markdownプレビュー
  call dein#add('iamcco/markdown-preview.vim')

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
let g:airline#extensions#ale#error_symbol = ' '
let g:airline#extensions#ale#warning_symbol = ' '
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1
nmap <C-e> <Plug>AirlineSelectPrevTab
nmap <C-y> <Plug>AirlineSelectNextTab
nnoremap <C-d> :bd<CR>



let g:indent_guides_enable_on_vim_startup = 1

" ウィンドウサイズ変更用プラグイン(winresizer)
" startコマンドのデフォルトctrl-eからctrl-uに変更
let g:winresizer_start_key = '<C-U>'
" 移動幅の設定
let g:winresizer_vert_resize = 3
let g:winresizer_horiz_resize = 1

" 保存時に末尾のスペースを削除
autocmd BufWritePre * %s/\s\+$//e




"----------カラースキーム-----------
" カスタマイズ

autocmd ColorScheme * highlight Comment ctermfg=246
autocmd ColorScheme * highlight Visual ctermbg=30
autocmd ColorScheme * highlight Search ctermbg=29
autocmd ColorScheme * highlight Pmenu ctermfg=236 ctermbg=37

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
autocmd Colorscheme * highlight IndentGuidesOdd  ctermbg=235
autocmd Colorscheme * highlight IndentGuidesEven ctermbg=236


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

" ale設定
let g:ale_sign_error = '✖︎'
let g:ale_sign_warning = '⚠︎'


" denite.nvim define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
        \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
        \ denite#do_map('toggle_select').'j'
endfunction

" denite.nvimにgrepではなくagで検索
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'default_opts', ['--follow', '--no-group', '--no-color'])

" denite.nvim キーマッピング
nnoremap <Space>f :<C-u>Denite file/rec<CR>
nnoremap <Space>b :<C-u>Denite buffer<CR>
nnoremap <Space>g :<C-u>Denite grep<CR>

" ヴィジュアルモードでペーストした際に削除した文字列をレジスタに格納しない
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" comfortable-motionの設定
let g:comfortable_motion_friction = 800.0 " 摩擦力
let g:comfortable_motion_air_drag = 3.0 " 空気抵抗
let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <silent> <C-f> :call comfortable_motion#flick(300)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(-300)<CR>

" deoplete.vimセッティング
let g:deoplete#enable_at_startup = 1

" set termguicolors    " ターミナルでも True Color を使えるようにする。

" gundo.vim
let g:gundo_prefer_python3 = 1 " python3で動作(デフォルトではpython2.4)
nnoremap <F5> :GundoToggle<CR>
