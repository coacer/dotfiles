runtime! settings/variables.vim

" Initialize lazy.nvim
lua require('config')
lua require('utils')

runtime! settings/base/*.vim
runtime! settings/lang/init.vim
if isdirectory('.neovim') && filereadable('.neovim/init.vim')
  source ./.neovim/init.vim
endif
