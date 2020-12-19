local bind = require('util.bind')
local key, ex_input, ex_range, ex, set_mappings =
bind.map_key, bind.map_ex_input, bind.map_ex_range, bind.map_ex, bind.set_mappings
local dump = require('util/helper').dump

-- ['{mode} | {keybind}'] = func(command):option()
-- # mode
-- n: normal
-- i: insert
-- v: visual
-- c: command
-- t: terminal
--
-- func/optionはメソッドチェーンで連結可能
-- # func
-- key(command): 'command'(コンバートなし)
-- ex(command, args...): ':<C-u>{command} {args...}<CR>'
-- ex_input(command, args...): ':<C-u>{command} {args...}'
-- ex_range(command, args...): ':{command} {args...}<CR>'
--
-- # option
-- recursive(): noremapを外す(デフォルトがnoremap)
-- with_silent(): <silent>
-- with_buffer(): <buffer>

local mappings = {
  -- Esc
  ['i | <C-l>'] = key('<Esc>'),
  ['c | <C-l>'] = key('<C-c>'),
  ['v | <C-l>'] = key('<Esc>'),
  ['s | <C-l>'] = key('<Esc>'),
  ['o | <C-l>'] = key('<Esc>'),
  ['l | <C-l>'] = key('<Esc>'),
  ['t | <Esc>'] = key([[<C-\><C-n>]]),
  ['t | <C-l>'] = key('<C-c>'):recursive(),
  ['n | <C-l>'] = ex('nohlsearch'):key('<C-l>'),

  -- Lua file
  ['n | <Leader>vv'] = ex('Files', ROOT_DIR),
  ['n | <Leader>vm'] = ex('edit', ROOT_DIR .. '/lua/core/mappings.lua'),
  ['n | <Leader>vf'] = ex('edit', ROOT_DIR .. '/lua/core/functions/init.lua'),
  ['n | <Leader>vo'] = ex('edit', ROOT_DIR .. '/lua/core/options.lua'),
  ['n | <Leader>vc'] = ex('edit', ROOT_DIR .. '/lua/core/color.lua'),
  ['n | <Leader>vd'] = ex('edit', ROOT_DIR .. '/lua/plugins/dein/dein.toml'),
  ['n | <Leader>vD'] = ex('edit', ROOT_DIR .. '/lua/plugins/dein/dein_lazy.toml'),
  ['n | <Leader>vs'] = ex('source', '$MYVIMRC'),

  -- session
  ['n | <Leader>sw'] = ex('mksession!', SESSION_FILE),
  ['n | <Leader>sq'] = ex('mksession!', SESSION_FILE):ex_range('qall'),
  ['n | <Leader>ss'] = ex('source', SESSION_FILE),
  ['n | <Leader>sd'] = ex('!rm', SESSION_FILE),

  -- write/quit
  ['n | <Leader>w'] = ex('write'),
  ['n | <Leader>q'] = ex('confirm', 'qall'),
  ['n | <Leader>z'] = ex('wqall'),

  -- register
  ['n | <Leader>r'] = key('"'),
  ['x | <Leader>r'] = key('"'),
  ['n | +'] = key('"+y'),
  ['n | ++'] = key('"+yy'),
  ['x | +'] = key('"+y'),
  ['n | x'] = key('"_x'),
  ['x | x'] = key('"_x'),
  ['n | Y'] = key('y$'),
  ['n | gyy'] = key('yy`]'),
  ['x | gy'] = key('y`>'),
  ['x | gp'] = key('gpk'),

  -- window
  ['n | s'] = key('<C-w>'),
  ['n | sv'] = key('<C-w>v<C-w>w'),
  ['n | ss'] = key('<C-w>s<C-w>w'),
  ['n | sN'] = ex('vnew'),

  -- buffer
  ['n | <C-d>'] = ex('bdelete'):with_silent(),

  -- command
  ['n | <Leader>S'] = ex_input('%s/<C-r>///g<Left><Left>'),
  ['n | <C-h>'] = ex('Helptags'),

  -- cursor
  ['n | j'] = key('gj'),
  ['n | k'] = key('gk'),
  ['n | ^'] = key('g^'),
  ['n | $'] = key('g$'),
  ['i | <C-f>'] = key('<Right>'),
  ['i | <C-b>'] = key('<Left>'),
  ['c | <C-p>'] = key('<Up>'),
  ['c | <C-n>'] = key('<Down>'),
  ['c | <C-b>'] = key('<Left>'),
  ['c | <C-f>'] = key('<Right>'),
  ['c | <C-a>'] = key('<Home>'),
  ['c | <C-e>'] = key('<End>'),

  -- operation
  ['n | *'] = key('*N'),
  ['n | g*'] = key('g*N'),
  ['i | <C-r><C-r>'] = key('<C-r>"'),
  ['c | <C-r><C-r>'] = key('<C-r>"'),
  ['t | <C-r><C-r>'] = key('<Esc>pi'):recursive(),
  ['n | <Leader>a'] = key('ggVG'),
  ['n | gJ'] = key('mz')
               :ex([[+1s/^\s\+//e]])
               :key('`zgJ')
               :ex('nohlsearch')
               :with_silent(),
  ['x | gJ'] = ex([['<+1,'>s/^\s\+//e]]):key('gvgJ'):ex('nohlsearch'):with_silent(),
  ['n | <C-j>'] = key('mzo<Esc>"_cc<Esc>`z'),
  ['n | <C-k>'] = key('mzO<Esc>"_cc<Esc>`z'),
  ['x | .'] = ex('normal'):with_silent(),

  -- custom command
  ['n | <Leader>tt'] = ex('Term'):with_silent(),
  ['n | <Leader>tg'] = ex('Term', 'lazygit'):with_silent(),
  ['n | <Leader>td'] = ex('Term', 'lazydocker'):with_silent(),
  ['n | <Leader><C-g><C-g>'] = ex('GitDiffStart'),
}

set_mappings(mappings)
