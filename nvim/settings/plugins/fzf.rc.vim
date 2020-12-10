nnoremap <Space>f :<C-u>Files<CR>
nnoremap <Space>F :<C-u>GFiles<CR>
nnoremap <Space>g :<C-u>GGrep<CR>
nnoremap <Space>b :<C-u>Buffers<CR>
nnoremap <Space>l :<C-u>BLines<CR>
" カーソル下の単語をGGrepで検索する
nmap <Space>* "zyiw<Space>g'<Esc>"zpi
vmap <Space>* "zy<Space>g'<Esc>"zpi

command! -bang -nargs=* GGrep
      \ call fzf#vim#grep(
      \   'git grep --line-number '.shellescape(<q-args>), 0,
      \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
