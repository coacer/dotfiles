autocmd FileType html,eruby call s:ERubySetting()

"===============================================
"                    Ruby
"===============================================
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
