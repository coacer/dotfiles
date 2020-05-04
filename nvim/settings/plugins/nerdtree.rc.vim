let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nnoremap <C-n> :<C-u>NERDTreeToggle<CR><C-l>
" アイコン有効化
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsOS = 'Darwin'
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
" let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
" 隠しファイルをデフォルトで表示
let NERDTreeShowHidden=1
highlight! link NERDTreeFlags NERDTreeDir
" autocmd ColorScheme * highlight Directory guifg=#98ffff
"NERDTreeのウィンドウしか開かれていないときは自動的に閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
      \ b:NERDTree.isTabTree()) | bd | endif
