augroup VimVue
  autocmd!
  autocmd FileType vue syntax sync fromstart
augroup END
" 重い動作解消
let g:vue_disable_pre_processors=1
