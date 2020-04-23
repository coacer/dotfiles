let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nnoremap <C-n> :<C-u>NERDTreeToggle<CR><C-l>
" アイコン有効化
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" 隠しファイルをデフォルトで表示
let NERDTreeShowHidden=1
autocmd ColorScheme * highlight Directory guifg=#98ffff
"NERDTreeのウィンドウしか開かれていないときは自動的に閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
      \ b:NERDTree.isTabTree()) | q | endif
