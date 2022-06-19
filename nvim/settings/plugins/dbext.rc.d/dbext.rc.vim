let s:plugin_name = 'dbext.vim'
let s:profile_config_file = '.neovim/dbext/profile.json'

function! s:load_profile() abort
  if !exists('s:profile_config_file') || !filereadable(s:profile_config_file)
    return
  endif

  let g:DbextProfile = ParseJsonFile(s:profile_config_file)
  let s:format = 'let g:dbext_default_profile_%s= "type=%s:host=%s:port=%d:user=%s:passwd=%s:dbname=%s"'
  let g:dbext_default_profile = g:DbextProfile['default']
  for [profile, item] in items(g:DbextProfile['profiles'])
    if item['ssh_over']
      execute printf(s:format, profile, item['driver'], '127.0.0.1', 3306, item['user'], item['password'], item['db_name'])
    else
      execute printf(s:format, profile, item['driver'], item['host'], item['port'], item['user'], item['password'], item['db_name'])
    endif
  endfor
endfunction

function! s:profile_init() abort
  if !isdirectory('.neovim')
    let g:hoge = 1
    call system('mkdir -p .neovim/dbext')
  elseif !isdirectory('.neovim/dbext')
    let g:hoge = 2
    call system('mkdir .neovim/dbext')
  endif

  call system('cp ' . g:ROOT_DIR . '/settings/plugins/dbext.rc.d/profile-sample.json ' . s:profile_config_file)
  execute 'edit' s:profile_config_file
endfunction

function! s:port_forward(profile_name) abort
  let profile = g:DbextProfile['profiles'][a:profile_name]
  if !profile['ssh_over']
    call Notify(s:plugin_name, "this profile's ssh_over is false.", "error")
    return
  endif

  call system(printf('ssh -f -N -L 3306:%s:%d -i %s %s@%s', profile['host'], profile['port'], profile['ssh_secret_key'], profile['ssh_user'], profile['ssh_host']))
endfunction

function! s:prompt_for_buffer_parameters() abort
  if !filereadable(s:profile_config_file)
    let answer = confirm("generate profile.json file?", "&Yes\nNo")
    if answer == 2
      return
    endif
    call s:profile_init()
    return
  elseif !exists('g:DbextProfile')
    call s:load_profile()
  endif
  call s:kill_port_forward_process()

  let i = 0
  let profile_list_str = ''
  let profile_num_dict = {}
  for [profile, item] in items(g:DbextProfile['profiles'])
    let i += 1
    let profile_list_str .= printf("%d: %s\n", i, profile)
    let profile_num_dict[i] = profile
  endfor

  let current_pf = DB_listOption('profile')
  let profile_num = input(printf("Please select a profile to connect database.\n%sEnter profile [%s] #: ", profile_list_str, current_pf))
  echo "\n\n"
  let target_pf_nm = ''
  if strlen(profile_num) != 0
    if !has_key(profile_num_dict, profile_num)
      call Notify(s:plugin_name, "Please enter the correct number.", 'warn')
      return
    endif
    let target_pf_nm = profile_num_dict[profile_num]
  else
    let target_pf_nm = current_pf
  endif
  if g:DbextProfile['profiles'][target_pf_nm]['ssh_over']
    call s:port_forward(target_pf_nm)
  endif

  execute 'DBSetOption profile=' . target_pf_nm

  DBCompleteTables

  call Notify(s:plugin_name, printf("'%s' profile was connected successfully.", target_pf_nm))

endfunction

function! s:kill_port_forward_process() abort
  call system("kill `ps aux | grep \"ssh -f\" | grep -v grep | awk '{print $2;}'`")
endfunction

call s:load_profile()

augroup Dbext
  autocmd!
  function! s:complete_table_and_notify() abort
    silent DBCompleteTables
    call Notify(s:plugin_name, 'Load db completed successfully.')
  endfunction
  if exists('g:dbext_default_profile') && strlen(g:dbext_default_profile) != 0
    autocmd VimEnter * call s:complete_table_and_notify()
  endif
  autocmd VimLeave * silent call s:kill_port_forward_process()
augroup end

command! DbextProfileSet call s:prompt_for_buffer_parameters()
command! DbextProfileLoad call s:load_profile()
nnoremap <Leader>sbp <Cmd>DbextProfileSet<CR>
