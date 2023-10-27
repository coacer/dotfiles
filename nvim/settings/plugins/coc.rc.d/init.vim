" coc-settings.jsonの読み込み
let g:coc_user_config = json_decode(readfile(expand(g:ROOT_DIR . '/settings/plugins/coc.rc.d/coc-settings.json')))

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Scalaプロジェクトではnvim-metalsを使用するためマッピングを無効化
" if !file_readable('build.sbt')
  execute 'source' g:ROOT_DIR . '/settings/plugins/coc.rc.d/mapping.vim'
" endif
