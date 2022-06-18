runtime! settings/variables.vim
runtime! settings/base/functions/*.vim
runtime! dein/init.vim
runtime! settings/base/*.vim
runtime! settings/lang/init.vim
if isdirectory('.neovim') && filereadable('.neovim/init.vim')
  source ./.neovim/init.vim
endif
