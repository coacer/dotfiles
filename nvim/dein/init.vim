let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

" 自動リキャッシュ なぜかファイル保存時にairlineのカラーが無効化する(バグ？)
" let g:dein#auto_recache = 1

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(g:ROOT_DIR . '/dein/dein.toml', {'lazy': 0})
  call dein#load_toml(g:ROOT_DIR . '/dein/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" 有効化されていないプラグインが存在するときアンインストールする
" let s:del_plugs = dein#check_clean()
" if len(s:del_plugs) > 0
"   call map(s:del_plugs, "delete(v:val, 'rf')")
"   call dein#recache_runtimepath()
" endif
