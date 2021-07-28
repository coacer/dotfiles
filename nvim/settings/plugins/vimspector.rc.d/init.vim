let g:vimspector_install_gadgets = ['vscode-node-debug2']
let g:vimspector_base_dir=expand('$HOME/.config/nvim/settings/plugins/vimspector.rc.d')

" Leader + d 無効化
nnoremap <Leader>d <Nop>
" ブレイクポイントトグル
nmap <Leader>dd <Plug>VimspectorToggleBreakpoint
" 開始(start)
nnoremap <Leader>ds :set noequalalways<CR>:<C-u>call vimspector#Launch()<CR>
" 閉じる(quit)
nnoremap <Leader>dq :set equalalways<CR>:<C-u>call vimspector#Reset()<CR>
" 処理を再開(continue)
nmap <Leader>dc <Plug>VimspectorContinue
" リスタート(restart)
nmap <Leader>dr <Plug>VimspectorRestart
" ステップオーバー(j: 下)
nmap <Leader>dj <Plug>VimspectorStepOver
" ステップイン(l: 右)
nmap <Leader>dl <Plug>VimspectorStepInto
" ステップアウト(h: 左)
nmap <Leader>dh <Plug>VimspectorStepOut

sign define vimspectorBP text=\ ◉ texthl=ErrorMsg
sign define vimspectorPCBP text=◉> texthl=ErrorMsg linehl=AlertMsg
sign define vimspectorPC text=>> texthl=AlertMsg linehl=AlertMsg

" TODO: .vimspector.jsonの自動生成コマンドを作成する
"       templates/のファイルをコピー
"       vimspector開始コマンド?全てのコマンド?が呼ばれた際にコマンドがコールバックされ、
"       設定ファイルを作成するよう促す

" TODO: phpのデバッガーをvdebugからvimspectorに乗り換える
"       xdebug裏側の設定最適化を検討 → コマンド一つで裏側の設定も作成?
