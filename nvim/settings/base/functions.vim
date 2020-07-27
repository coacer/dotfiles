" vim: foldmethod=marker

" サクセスメッセージ出力関数 {{{
function! s:echo_success(msg) abort
  echohl SuccessMsg
  echo a:msg
  echohl None
endfunction
" }}}

" アラートメッセージ出力関数 {{{
function! s:echo_alert(msg) abort
  echohl AlertMsg
  echo 'Alert:' a:msg
  echohl None
endfunction
" }}}

" エラー出力関数 {{{
function! s:echo_err(msg) abort
  echohl ErrorMsg
  echomsg 'Error[functions.vim]:' a:msg
  echohl None
endfunction
" }}}


" :SyntaxInfoコマンドでカーソル下のシンタックスグループ名を表示する関数 {{{
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
  let @s = baseSyn.name
  let @g = linkedSyn.name
endfunction
" }}}

" syntax情報を表示 + @sにsyntaxネーム, @gにsyntax groupのネームを格納
command! SyntaxInfo call s:get_syn_info()

" ヴィジュアルモードでペーストした際に削除した文字列をレジスタに格納しない {{{
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
" }}}

" カラーコードの上で実行するとカラーピッカーが表示する
command! ColorPicker call CocAction('pickColor')
" カラースキームをプレビューしながら変更できる
command! ColorSchemeSelect Unite colorscheme -auto-preview

" deinの未使用プラグイン削除 {{{
function! s:dein_delete()
  echo "Please wait a little ...."
  call map(dein#check_clean(), "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
  redraw
  call s:echo_success("Finish clean up!")
endfunction
command! DeinDel call <SID>dein_delete()
" }}}


" floating window を用いてターミナルを表示させる {{{
let s:float_term_border_win = 0
let s:float_term_win = 0
function! s:float_term(...)
  " 画面サイズからウィンドウの位置とサイズを決定しnumberにキャスト
  let height = float2nr((&lines - 2) * 0.6)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns * 0.6)
  let col = float2nr((&columns - width) / 2)
  " Border Window
  let border_opts = {
        \ 'relative': 'editor',
        \ 'row': row - 1,
        \ 'col': col - 2,
        \ 'width': width + 4,
        \ 'height': height + 2,
        \ 'style': 'minimal'
        \ }
  " Terminal Window
  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  let top = "╭" . repeat("─", width + 2) . "╮"
  let mid = "│" . repeat(" ", width + 2) . "│"
  let bot = "╰" . repeat("─", width + 2) . "╯"
  let lines = [top] + repeat([mid], height) + [bot]
  let bbuf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(bbuf, 0, -1, v:true, lines)
  let s:float_term_border_win = nvim_open_win(bbuf, v:true, border_opts)
  let buf = nvim_create_buf(v:false, v:true)
  let s:float_term_win = nvim_open_win(buf, v:true, opts)
  " floating windowで表示されるカラー
  hi FloatTerm guifg=#598f89 guibg=#434c5e
  call setwinvar(s:float_term_border_win, '&winhl', 'Normal:FloatTerm')
  call setwinvar(s:float_term_win, '&winhl', 'Normal:NormalFloat')
  if a:1 ==# ''
    terminal
  else
    call termopen(a:1)
  endif
  startinsert
  " Close border window when terminal window close
  autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_border_win, v:true)
endfunction
" }}}

" FloatTerm実行時に任意のコマンド呼び出し {{{
function! s:term_invoke(...) abort
  if a:0 > 0
    let cmd = a:1
  else
    let cmd = input("Please input command: ")
  endif
  call s:float_term(cmd)
endfunction
" }}}

" 引数がある時はそのコマンドを実行し、無い時は入力を促す
command! -nargs=? Term call <SID>term_invoke(<f-args>)


" xdebugの設定ファイル(.vdebug.conf.vim)を作成するコマンド(以下ファイル例) {{{
" == Sample(.vdebug.conf.vim) ==
" let g:xdebug_port = 9001
" let g:xdebug_guest_path = '/var/www/app'
" let g:xdebug_host_path = '/Users/user_name/your/app/path'

function! s:xdebug_generate_conf() abort
  let outputfile = '.vdebug.conf.vim'

  " 設定ファイルが存在したら上書きするか確認
  if filereadable(outputfile)
    let answer = confirm("既に設定ファルが存在します。\n上書きしますか？", "&Yes\nNo")
    if answer == 2
      return
    endif
  endif

  let port = input("ポート番号を入力してください: ")
  " 数字以外の場合エラー
  if (empty(port) || port =~# '\D')
    call s:echo_err("正しく入力してください")
    return
  endif

  let guest_path = input("マウントしてるパスを入力してください: ")
  " 空の場合エラー
  if (empty(guest_path) || guest_path =~# '\s\+')
    call s:echo_err("正しく入力してください")
    return
  endif

  " 設定ファイル書き込み
  execute 'redir! >' outputfile
    silent echon '"  ========Vdebug======== "' . "\n"
    silent echon 'let g:xdebug_port = ' . port . "\n"
    silent echon 'let g:xdebug_guest_path = ' . '"' . guest_path . '"'. "\n"
    silent echon 'let g:xdebug_host_path = ' . '"' . substitute(execute("pwd"), "\n", "", "g") . '"' . "\n"
  redir END
  execute 'edit' outputfile
  substitute/^\s\+//e
  silent write
  bdelete

  " 結果出力
  echo "==== Xdebug Settings ==="
  echo ' '
  echo 'PORT: ' . port
  echo 'GUEST PATH: ' . guest_path
  let success_msg = '"' . outputfile . '"' . ' is created!'
  call s:echo_success(success_msg)
  echo ' '
  echo '再起動してください'
endfunction

command! XdebugInit call <SID>xdebug_generate_conf()
" }}}


" GitStatusDiff: gitのstageと差分のあるファイルをquickfixに出力し、Gdiffコマンドで差分表示する {{{
"                検索対象のディレクトリ指定可能

"                [マッピング]
  "                ctrl+n: 次のファイル差分へ
  "                ctrl+p: 前のファイル差分へ
  "                ctrl+j: 番号指定でジャンプ(プロンプトに数字を入力)
  "                [n] ctrl+j: n番目のバッファにジャンプ
  "                q: 終了

" `git status`の結果をquickfixとして出力
" args: dir(検索対象のディレクトリ)
" return: number(差分ファイル数)
function! s:git_status_list(dir) abort
  " カレントディレクトリがgit管理下でない場合例外
  if empty(system('git rev-parse --git-dir 2> /dev/null'))
    throw "Not a git repository"
  endif
  let status = systemlist("git diff --name-only")

  let root_dir = trim(system("git rev-parse --show-toplevel")) . '/'

  let files = []
  let index = 1
  for l in status
    if (!empty(a:dir) && l !~# "^" . a:dir . "/.*")
      continue
    endif

    let filename = root_dir . l
    let info = {'filename': filename}
    let info.lnum = index
    let info.text = '✗'
    call add(files, info)
    unlet info
    let index += 1
  endfor
  if len(files) <= 0 | throw "Not found difference or directory" | endif
  call setqflist(files, 'r')
  cwindow
  cfirst
  " 不具合があるため
  edit!
  return len(files)
endfunction

" 差分を表示 + ウィンドウ初期化
function! s:git_diff() abort
  Gdiff
  " ウィンドウ最上部に移動
  wincmd w
  execute "normal! 99999\<C-b>"
endfunction

" ファイルが指定されたディレクトリ内のファイルか判定
" args: file(ファイル名), dir(ディレクトリ名)
" return: bool
function! s:is_match_dir(file, dir) abort
  
endfunction

" git_diff初期化
function! s:git_diff_init() abort
  try
    " セッションに今の状態を保持
    let s:git_diff_session_file = '.git_diff_tmp.vim'
    execute 'mksession!' s:git_diff_session_file
    " マッピング定義
    nnoremap <silent> q :GitDiffFin<CR>
    nnoremap <C-n> :<C-u>GitStatusNext<CR>
    nnoremap <C-p> :<C-u>GitStatusPrevious<CR>
    nnoremap <C-j> :<C-u>call GitDiffJump(v:count)<CR>
    silent! wincmd o
    let dir = input("Please input target directory > ")
    let s:git_diff_count = s:git_status_list(dir)
    call s:git_diff()
  catch
    redraw
    call s:git_diff_fin(-1)
    call s:echo_err(v:exception)
  endtry
endfunction

" 引数のbufferにジャンプ
" args: buf_num(バッファーのnumber or 'next' or 'pre')
function! s:git_diff_jump(buf_num) abort
  " quickfixのバッファにフォーカスしている時はウィンドウ移動
  if &filetype == 'qf'
    wincmd w
  endif

  wincmd c
  try
    if a:buf_num ==# 'next'
      cnext
    elseif a:buf_num ==# 'pre'
      cprevious


    else
      execute "cc!" a:buf_num
    endif
  " 一番最後または最初だった時のエラーハンドリング
  catch /^Vim\%((\a\+)\)\=:E553/
    if a:buf_num ==# 'pre'
      let msg = "end"
      clast
    else
      let msg = "front"
      cfirst
    endif
    call s:echo_alert("no more items")
    call s:echo_alert("jump " . msg)

  " それ以外の不正な引数だった時のエラーハンドリング
  catch
    call s:echo_err("Bad argument")
  endtry

  call s:git_diff()
endfunction

" ジャンプするバッファ番号をチェック
" args: j_num(ジャンプするバッファ番号)
function! GitDiffJump(j_num) abort
  if a:j_num > 0
    let j_num = a:j_num
  else
    let j_num = input('Please input jump numbrer > ')
  endif
  call s:git_diff_jump(j_num)
endfunction

" git_diff 終了関数
" a:1 異常終了フラグ -1の場合異常終了
function! s:git_diff_fin(...) abort
  execute 'source' s:git_diff_session_file
  call system('rm ' . s:git_diff_session_file)
  nunmap q
  " 元のマッピングを定義
  nnoremap <silent> <C-n> :<C-u>NERDTreeToggle<CR>
  nunmap <C-p>
  nnoremap <C-j> mzo<Esc>"_cc<Esc>`z
  " 異常終了の場合と分岐
  if a:0 ==# 1 && a:1 ==# -1
    call s:echo_err("git diff abort")
  else
    call s:echo_success("git diff finished!")
  endif
endfunction


command! -nargs=0 GitStatusDiff call <SID>git_diff_init()
command! -nargs=0 GitStatusNext call <SID>git_diff_jump('next')
command! -nargs=0 GitStatusPrevious call <SID>git_diff_jump('pre')
command! -nargs=0 GitDiffFin call <SID>git_diff_fin()
" }}}

" 現在のファイル名(拡張子抜き)を返す関数
function! FileName() abort
  return expand('%:t:r')
endfunction
