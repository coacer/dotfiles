" ========Vdebug======== "
" let g:xdebug_port = str2nr('9001')
" let g:xdebug_guest_path = '/var/www/app'
" let g:xdebug_host_path = substitute(execute('pwd'), "\n", '', 'g')

" 設定ファイル名
let s:vdebug_file = '.vdebug.conf.vim'

" 設定ファイルが存在したらパラメータを読み込み
if (filereadable(s:vdebug_file))
  execute 'source ' . s:vdebug_file
endif

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
