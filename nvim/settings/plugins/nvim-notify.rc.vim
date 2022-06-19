let s:notify = luaeval('require("notify")')

function! s:init() abort
lua << EOF
require('notify').setup({
  background_colour = "Normal",
  fps = 60,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = ""
  },
  level = 2,
  minimum_width = 65,
  render = "default",
  stages = "slide",
  timeout = 6000
})
EOF
endfunction

function! g:Notify(title, msg, type = 'info') abort
  call s:notify.notify(a:msg, a:type, { 'title': a:title })
endfunction

call s:init()
highlight NotifyERRORTitle  guifg=#FFFFFF
