let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nnoremap <silent> <C-n> :<C-u>NERDTreeToggle<CR>
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
augroup NERDTreeSettings
  autocmd!
  " autocmd ColorScheme * highlight Directory guifg=#98ffff
  "NERDTreeのウィンドウしか開かれていないときは自動的に閉じる
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
        \ b:NERDTree.isTabTree()) | bd | endif
augroup END
" 表示しないファイル
let NERDTreeIgnore = [
	\ '\.git$', '\.DS_Store$', '\.sass-cache$'
	\ ]
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'
