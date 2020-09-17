" vim: foldmethod=marker

" サクセスメッセージ出力関数 {{{
function! EchoSuccess(msg) abort
  echohl SuccessMsg
  echo a:msg
  echohl None
endfunction
" }}}

" アラートメッセージ出力関数 {{{
function! EchoAlert(msg) abort
  echohl AlertMsg
  echo 'Alert:' a:msg
  echohl None
endfunction
" }}}

" エラー出力関数 {{{
function! EchoErr(msg) abort
  echohl ErrorMsg
  echomsg 'Error[' . expand('<sfile>:p:t') . ']:' a:msg
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

" カラーピッカーを表示 {{{
command! ColorPicker call <SID>color_picker()
function! s:color_picker() abort
  " カーソル下の文字列がカラーコードでない場合は挿入する
  if (!s:is_color_code(expand('<cword>')))
    let undo_seq_current = undotree().seq_cur
    " カーソル位置が末尾だった場合は末尾にカラーコード挿入
    if col('.') == col('$') - 1
      normal! a#FFFFFF
    else
      normal! i#FFFFFF
    endif
    if (!s:is_color_code(expand('<cword>')))
      " ロールバック
      execute 'undo' undo_seq_current
      redraw!
      return EchoErr('word under the cursor is not color code')
    endif
    sleep 300m "normalの処理が遅いため
  endif
  call CocAction('pickColor')
  normal! gUiw
endfunction

function! s:is_color_code(str) abort
  return a:str =~# '\<#\?\(\x\{3}\|\x\{6}\)\>'
endfunction
" }}}
" カラースキームをプレビューしながら変更できる
command! ColorSchemeSelect Unite colorscheme -auto-preview

" deinの未使用プラグイン削除 {{{
function! s:dein_delete()
  echo "Please wait a little ...."
  call map(dein#check_clean(), "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
  redraw
  call EchoSuccess("Finish clean up!")
endfunction
command! DeinDel call <SID>dein_delete()
" }}}

" floating window を用いてターミナルを表示させる {{{
let s:float_term_border_win = 0
let s:float_term_win = 0
function! s:float_term(...)
  " 画面サイズからウィンドウの位置とサイズを決定しnumberにキャスト
  let height = float2nr((&lines - 2) * 0.7)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns * 0.7)
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
    call EchoErr("正しく入力してください")
    return
  endif

  let guest_path = input("マウントしてるパスを入力してください: ")
  " 空の場合エラー
  if (empty(guest_path) || guest_path =~# '\s\+')
    call EchoErr("正しく入力してください")
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
  call EchoSuccess(success_msg)
  echo ' '
  echo '再起動してください'
endfunction

command! XdebugInit call <SID>xdebug_generate_conf()
" }}}

" 現在のファイル名(拡張子抜き)を返す関数 {{{
function! FileName() abort
  return expand('%:t:r')
endfunction
" }}}

" terraform フォーマット整形コマンド {{{
function! s:terraform_fmt(...) abort
  let file = a:0 > 0 ? a:1 : expand('%')
  echo 'Now formatting...'
  call system('terraform fmt ' . file) | edit %
  redraw
  call EchoSuccess('formatted.')
endfunction

command! -nargs=? TfFmt call <SID>terraform_fmt(<f-args>)
" }}}
