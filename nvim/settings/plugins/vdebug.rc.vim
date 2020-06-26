" ========Vdebug======== "
" let g:xdebug_port = str2nr('9001')
" let g:xdebug_guest_path = '/var/www/app'
" let g:xdebug_host_path = substitute(execute('pwd'), "\n", '', 'g')

" 設定ファイル名
let s:vdebug_file = '.vdebug.conf.vim'

" 設定ファイルが存在したら設定
if (filereadable(s:vdebug_file))
  execute 'source ' . s:vdebug_file

  " パラメータを元に設定
  let g:vdebug_options= {
        \    "port" : g:xdebug_port,
        \    "timeout" : 20,
        \    "on_close" : 'detach',
        \    "break_on_open" : 0,
        \    "remote_path" : "",
        \    "local_path" : "",
        \    "debug_window_level" : 0,
        \    "debug_file_level" : 0,
        \    "debug_file" : "",
        \    "path_maps" : {
        \       g:xdebug_guest_path : g:xdebug_host_path,
        \    },
        \    "window_arrangement" : ["DebuggerWatch", "DebuggerStack"]
        \}

  " HighLight
  highlight DbgCurrentLine guibg=#774449
  highlight DbgCurrentSign guibg=#774449
  highlight DbgBreakptLine guibg=#395640
  highlight DbgBreakptSign guibg=#395640

  " Mappings
  " Leader + x 無効化
  nnoremap <Leader>x <Nop>
  " ブレイクポイント設置/削除
  nmap <Leader>xx <F10>
  " xdebug開始(start)
  nmap <Leader>xs <F5>
  " xdebug終了/閉じる(delete)
  nmap <Leader>xd <F6>
  " ステップオーバー(j: 下)
  nmap <Leader>xj <F2>
  " ステップイン(l: 右)
  nmap <Leader>xl <F3>
  " ステップアウト(h: 左)
  nmap <Leader>xh <F4>
  " カーソル下を評価(evaluate)
  nmap <Leader>xe <F12>

endif
