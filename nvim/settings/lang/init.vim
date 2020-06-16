autocmd FileType html,eruby call s:ERubySetting()

"===============================================
"                    Ruby
"===============================================
" rubyファイル保存時に自動で実行するかを有効化/無効化コマンド
command! RubyExecEnable call <SID>RubyExecToggle(1)
command! RubyExecDisable call <SID>RubyExecToggle(0)

function! s:RubyExecToggle(flag) abort
  augroup ruby_gp
    autocmd!
    if a:flag
      autocmd BufWritePost *.rb !ruby %
    endif
  augroup END
endfunction

function! s:ERubySetting() abort
  " ctrl+j -/= でerbのカッコを表示
  inoremap <C-j>- <%  %><Left><Left><Left>
  inoremap <C-j>= <%=  %><Left><Left><Left>
  inoremap <C-j># <%#  %><Left><Left><Left>
endfunction


"===============================================
"                    PHP
"===============================================
" タブを空白4に設定
autocmd FileType php setlocal tabstop=4 | setlocal shiftwidth=4
" volt拡張子はhtmldjangoとシンタックスが似ているため設定
autocmd BufNewFile,BufRead *.volt set filetype=htmldjango
