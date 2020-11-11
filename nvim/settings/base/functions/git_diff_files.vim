" GitDiffFiles: 'git diff'の差分ファイルをquickfixで管理し差分表示する

"                [入力項目]
"                差分をみる対象パス(デフォルトはプロジェクトルート)
"                ブランチ名(入力しなかった場合ワーキングディレクトリとステージの差分)

"                [マッピング]
"                  ctrl+n: 次のファイル差分へ
"                  ctrl+p: 前のファイル差分へ
"                  ctrl+j: 番号指定でジャンプ(プロンプトに数字を入力)
"                  [n] ctrl+j: n番目のバッファにジャンプ
"                  q: 終了

" `git diff`の結果をquickfixとして出力
" args: dir(検索対象のディレクトリ)
" return: number(差分ファイル数)
function! s:git_diff_list(dir, branch1, branch2) abort
  " カレントディレクトリがgit管理下でない場合例外
  if empty(system('git rev-parse --git-dir 2> /dev/null'))
    throw "Not a git repository"
  endif
  "macOSデフォルト設定の場合head(小文字)でも大丈夫だがOSや設定に依存しないよう変換
  let branch1 = a:branch1 ==# 'head' ? 'HEAD' : a:branch1
  let branch2 = a:branch2 ==# 'head' ? 'HEAD' : a:branch2
  let diff = systemlist("git diff --name-only " . branch1 . ' ' . branch2)

  let root_dir = trim(system("git rev-parse --show-toplevel")) . '/'

  let files = []
  let index = 1
  for l in diff
    if (!empty(a:dir) && l !~# "^" . a:dir . "/.*")
      continue
    endif

    let filename = root_dir . l
    let info = {'filename': filename}
    let info.lnum = index
    let info.text = '✗'
    call add(files, info)
    unlet info
    let index += 1
  endfor
  if len(files) <= 0 | throw "Not found difference or directory" | endif
  call setqflist(files, 'r')
  cwindow
  call s:git_diff_mapping()
  cfirst
  " 不具合があるため
  edit!
  return len(files)
endfunction

" マッピング定義
function! s:git_diff_mapping() abort
    nnoremap <buffer> <silent> q :GitDiffFin<CR>
    nnoremap <buffer> <C-n> :<C-u>GitDiffNext<CR>
    nnoremap <buffer> <C-p> :<C-u>GitDiffPrevious<CR>
    nnoremap <buffer> <C-j> :<C-u>call GitDiffJump(v:count)<CR>
endfunction

" 差分を表示 + ウィンドウ初期化
function! s:git_diff() abort
  Gdiff
  " diffの2つのバッファにマッピング設定
  call s:git_diff_mapping()
  wincmd w
  call s:git_diff_mapping()
  " ウィンドウ最上部に移動
  execute "normal! 99999\<C-b>"
endfunction

" git_diff初期化
function! s:git_diff_init() abort
  try
    let dir = input("Please input target directory: ")
    let branch1 = input("Please input branch name: ")
    let branch2 = empty(branch1) ? '' : input("Please input another branch name: ")
    " if !empty(branch1) && !s:is_valid_branches(branch1, branch2)
    " if !empty(branch1)
    "   throw "Invalid branch name"
    " endif

    " セッションに今の状態を保持
    let s:git_diff_session_file = '.git_diff_tmp.vim'
    execute 'mksession!' s:git_diff_session_file
    silent! wincmd o

    call s:git_diff_list(dir, branch1, branch2)
    call s:git_diff()
  " 入力を中断した場合エラーではなく正常終了として処理する
  catch /^Vim:Interrupt$/
    echo 'git diff aborted'
  catch
    redraw
    call s:git_diff_fin(-1)
    call EchoErr(v:exception)
  endtry
endfunction

function! s:is_valid_branches(branch1, branch2) abort
  let valid_branches = systemlist('git branch -a')
  " HEADも許容する
  call add(valid_branches, 'HEAD')
  call add(valid_branches, 'head')

  let is_valid_branch1 = v:false
  let is_valid_branch2 = v:false
  for valid_branch in valid_branches
    let valid_branch = trim(valid_branch)
    if a:branch1 ==# valid_branch
      let is_valid_branch1 = v:true
    endif
    if a:branch2 ==# valid_branch
      let is_valid_branch2 = v:true
    endif
  endfor

  return is_valid_branch1 && is_valid_branch2 ? v:true : v:false
endfunction

" 引数のbufferにジャンプ
" args: buf_num(バッファーのnumber or 'next' or 'pre')
function! s:git_diff_jump(buf_num) abort
  " quickfixのバッファにフォーカスしている時はウィンドウ移動
  if &filetype == 'qf'
    wincmd w
  endif

  wincmd c
  try
    if a:buf_num ==# 'next'
      cnext
    elseif a:buf_num ==# 'pre'
      cprevious
    else
      execute "cc!" a:buf_num
    endif
  " 一番最後または最初だった時のエラーハンドリング
  catch /^Vim\%((\a\+)\)\=:E553/
    if a:buf_num ==# 'pre'
      let msg = "end"
      clast
    else
      let msg = "front"
      cfirst
    endif
    call EchoAlert("no more items")
    call EchoAlert("jump " . msg)

  " それ以外の不正な引数だった時のエラーハンドリング
  catch
    call EchoErr("Bad argument")
  endtry

  call s:git_diff()
endfunction

" ジャンプするバッファ番号をチェック
" args: j_num(ジャンプするバッファ番号)
function! GitDiffJump(j_num) abort
  if a:j_num > 0
    let j_num = a:j_num
  else
    let j_num = input('Please input jump numbrer: ')
  endif
  call s:git_diff_jump(j_num)
endfunction

" git_diff 終了関数
" a:1 異常終了フラグ -1の場合異常終了
function! s:git_diff_fin(...) abort
  if exists('s:git_diff_session_file') && filereadable(s:git_diff_session_file)
    %bdelete
    execute 'source' s:git_diff_session_file
    call system('rm ' . s:git_diff_session_file)
  endif
  " 異常終了の場合と分岐
  if a:0 ==# 1 && a:1 ==# -1
    call EchoErr("git diff aborted")
  else
    call EchoSuccess("git diff finished!")
  endif
endfunction


command! -nargs=0 GitDiffFiles call <SID>git_diff_init()
command! -nargs=0 GitDiffNext call <SID>git_diff_jump('next')
command! -nargs=0 GitDiffPrevious call <SID>git_diff_jump('pre')
command! -nargs=0 GitDiffFin call <SID>git_diff_fin()
