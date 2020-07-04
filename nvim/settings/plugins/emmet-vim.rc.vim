" noremalモードでの空行挿入コマンド(ctrl+j)と競合してしまうので
" imapでctrl+jに割当て
let g:user_emmet_leader_key = '<C-h>'
imap <C-j> <C-h>
