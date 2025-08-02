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

" 現在のファイルに最も近い設定ファイルを探索する関数
function! s:find_config_file(filename)
  let l:current_dir = expand('%:p:h')
  while l:current_dir != '/'
    if filereadable(l:current_dir . '/' . a:filename)
      return 1
    endif
    let l:current_dir = fnamemodify(l:current_dir, ':h')
  endwhile
  return 0
endfunction

" 保存時に適切なフォーマッターを実行
function! s:format_on_save()
  call CocAction('format')
  " if s:find_config_file('.prettierrc') || s:find_config_file('.prettierrc.json')
  "   CocCommand prettier.formatFile
  " elseif s:find_config_file('.eslintrc') || s:find_config_file('.eslintrc.json')
  "   CocCommand eslint.executeAutofix
  " endif
endfunction

augroup CocJsFormatter
  autocmd!
  autocmd BufWritePre *.js call s:format_on_save()
  autocmd BufWritePre *.ts call s:format_on_save()
  autocmd BufWritePre *.tsx call s:format_on_save()
  autocmd BufWritePre *.vue call s:format_on_save()
augroup END

function! s:go_format_on_save()
  call CocAction('format')
endfunction

augroup CocGoFormatter
  autocmd!
  autocmd BufWritePre *.go call s:go_format_on_save()
augroup END
