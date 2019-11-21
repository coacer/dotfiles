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
noswapfile
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

" ctrl+lでesc
inoremap <C-l> <Esc>
cnoremap <C-l> <Esc>
vnoremap <C-l> <Esc>
tmap <C-l> <Esc>

" スペース+vで.vimrcファイルを開く
nnoremap <Space>v :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>V :<C-u>vsplit $MYVIMRC<CR>

" スペース+sで.vimrcファイルを読み込む
nnoremap <Space>s :<C-u>source $MYVIMRC<CR>

" スペース+mでmyvim_manual.txtファイルを開く
nnoremap <Space>m :<C-u>vsplit ~/Documents/Memo/myvim_manual.txt<CR>

" space+aで全選択
nnoremap <Space>a ggVG

" xで文字を消した際にレジスタに格納しない
nnoremap x "_x
vnoremap x "_x

" Yでカーソル位置から行末までコピー
nnoremap Y y$

" Enterで下に空行挿入
nnoremap <CR> mzo<Esc>"_cc<Esc>`z

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

" ctrl+j -/= でerbのカッコを表示
inoremap <C-j>- <%  %><Left><Left><Left>
inoremap <C-j>= <%=  %><Left><Left><Left>

" *で検索時に次の検索文字に移動しないように設定
nnoremap * mq*`q

" space + t でtigを開く
nnoremap <Space>t :<C-u>!tig<CR>


" <ctrl+r>*2で無名レジスタ
inoremap <C-r><C-r> <C-r>"
cnoremap <C-r><C-r> <C-r>"


" Required:
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundle')
  call dein#begin('~/.vim/bundle')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#add('roxma/nvim-yarp') " neovim用プラグインを動かすためのプラグイン
  call dein#add('roxma/vim-hug-neovim-rpc') " neovim用プラグインを動かすためのプラグイン
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



" 保存時に末尾のスペースを削除
autocmd BufWritePre * %s/\s\+$//e




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
