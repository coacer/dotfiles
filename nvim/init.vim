runtime! settings/variables.vim
runtime! settings/base/functions/*.vim

" Initialize lazy.nvim
lua require('lazy.bootstrap')

runtime! settings/base/*.vim
runtime! settings/lang/init.vim
if isdirectory('.neovim') && filereadable('.neovim/init.vim')
  source ./.neovim/init.vim
endif
