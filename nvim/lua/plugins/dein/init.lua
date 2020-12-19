local isdir = require('util.fs').isdir

local dein_dir = HOME .. '/.cache/dein'
local dein_repo_dir = dein_dir .. '/repos/github.com/Shougo/dein.vim'

if not vim.o.runtimepath:match('/dein.vim') then
  if not isdir(dein_repo_dir) then
    os.execute('!git clone https://github.com/Shougo/dein.vim ' .. dein_repo_dir)
  end
  vim.cmd('set runtimepath^=' .. dein_repo_dir)
end

if vim.fn['dein#load_state'](dein_dir) == 1 then
  vim.fn['dein#begin'](dein_dir)
  vim.fn['dein#load_toml'](ROOT_DIR .. '/lua/plugins/dein/dein.toml', { lazy = 0 })
  vim.fn['dein#load_toml'](ROOT_DIR .. '/lua/plugins/dein/dein_lazy.toml', { lazy = 1 })
  vim.fn['dein#end']()
  vim.fn['dein#save_state']()
end

vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')

if vim.fn['dein#check_install']() == 1 then
  vim.fn['dein#install']()
end
