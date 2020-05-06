" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
" 自動リキャッシュ なぜかファイル保存時にairlineのカラーが無効化する(バグ？)
" let g:dein#auto_recache = 1

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein/dein_lazy.toml', {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

let s:del_plugs = dein#check_clean()
if len(s:del_plugs) > 0
  call map(s:del_plugs, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
