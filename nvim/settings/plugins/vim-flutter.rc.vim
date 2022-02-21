if !exists('g:flutter_option')
  let g:flutter_option = ''
endif
execute 'nnoremap <Leader>DD <Cmd>FlutterRun ' . g:flutter_option . '<CR>'
