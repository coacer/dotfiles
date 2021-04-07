" let g:airline_theme = 'bubblegum'
" set laststatus=0
" let g:airline_disable_statusline = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#default#layout = [['a', 'c'], ['x', 'y']]
let g:airline_section_c = '%t'
let g:airline_section_x = '%{&filetype}'
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1
nmap <C-e> <Plug>AirlineSelectPrevTab
nmap <C-y> <Plug>AirlineSelectNextTab
