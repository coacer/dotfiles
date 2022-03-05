runtime! settings/variables.vim
runtime! dein/init.vim
runtime! settings/base/*.vim
runtime! settings/base/functions/*.vim
runtime! settings/lang/init.vim
if isdirectory('.neovim')
  source ./.neovim/init.vim
endif
