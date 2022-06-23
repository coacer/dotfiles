" カーソル下の単語をGGrepで検索する
" nmap <Leader>* "zyiw<Leader>g'<Esc>"zpi
" vmap <Leader>* "zy<Leader>g'<Esc>"zpi

" プレビューウィンドウ無効化
" let g:fzf_preview_window = []
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
" let g:fzf_colors = {
"   \ 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment']
" \ }
command! -bang -nargs=* GGrep
      \ call fzf#vim#grep(
      \   'git grep --line-number '.shellescape(<q-args>), 0,
      \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" Mappings
" nnoremap <Leader>f :<C-u>Files<CR>
" nnoremap <Leader>F :<C-u>GFiles<CR>
" nnoremap <Leader>g :<C-u>GGrep<CR>
" nnoremap <Leader>b :<C-u>Buffers<CR>
" nnoremap <Leader>l :<C-u>BLines<CR>
