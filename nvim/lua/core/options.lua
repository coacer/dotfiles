local bind = require('util.bind')

local options = {
  fileencoding   = 'utf-8',
  fileencodings  = 'ucs-boms,utf-8,euc-jp,cp932',
  fileformats    = 'unix,dos,mac',
  hidden         = true,
  undofile       = true,
  termguicolors  = true,
  pumblend       = 40,
  winblend       = 30,
  expandtab      = true,
  tabstop        = 2,
  softtabstop    = 2,
  smartindent    = true,
  shiftwidth     = 2,
  ignorecase     = true,
  smartcase      = true,
  inccommand     = split,
  ttimeoutlen    = 50,
  virtualedit    = block,
  number         = true,
  relativenumber = true,
  cursorline     = true,
  showmatch      = true,
  fixendofline   = false,
}

local settings = {
  -- scriptencoding = 'utf-8',
  lang = 'en_US.UTF-8',
  source = '$VIMRUNTIME/macros/matchit.vim'
}

bind.set_options(options)
bind.set_settings(settings)
