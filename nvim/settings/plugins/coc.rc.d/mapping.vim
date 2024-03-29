" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gR <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap for rename current word
nmap gn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h' expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

augroup CocSettings
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup end

" golang autoformatter
" autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=0 EslintFix :CocCommand eslint.executeAutofix
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" TODO 柔軟に対応できるよう整備
augroup CocJsFormatter
  autocmd!
  " if filereadable('.prettierrc')
    " autocmd BufWritePre *.js Prettier
    " autocmd BufWritePre *.ts Prettier
    " autocmd BufWritePre *.tsx Prettier
    " autocmd BufWritePre *.vue Prettier
  " elseif filereadable('.eslintrc')
    " autocmd BufWritePre *.js EslintFix
    " autocmd BufWritePre *.ts EslintFix
    " autocmd BufWritePre *.tsx EslintFix
    " autocmd BufWritePre *.vue EslintFix
  " endif
augroup END
