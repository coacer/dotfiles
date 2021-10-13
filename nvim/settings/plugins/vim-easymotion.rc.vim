map <Leader>j <Plug>(easymotion-bd-w)
" map <Leader>j <Plug>(easymotion-overwin-w)
let g:easymotion#is_active = 0
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable
" function! EasyMotionCoc() abort
"   if EasyMotion#is_active()
"     let g:easymotion#is_active = 1
"     CocDisable
"   else
"     if g:easymotion#is_active == 1
"       let g:easymotion#is_active = 0
"       CocEnable
"     endif
"   endif
" endfunction
" autocmd TextChanged,CursorMoved * call EasyMotionCoc()
