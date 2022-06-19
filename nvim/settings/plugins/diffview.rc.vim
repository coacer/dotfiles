let s:diff_close_key = 'q'

function! s:diff_open() abort
  DiffviewOpen
  execute 'nnoremap <silent>' s:diff_close_key ':DiffClose<CR>'
endfunction

function! s:diff_close() abort
  DiffviewClose
  execute 'unmap' s:diff_close_key
endfunction

command! DiffOpen call s:diff_open()
command! DiffClose call s:diff_close()
