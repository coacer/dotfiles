-- Database client
return {
  'vim-scripts/dbext.vim',
  cmd = { 'DBExecSQL', 'DBCompleteTables' },
  config = function()
    local plugin_name = 'dbext.vim'
    local profile_config_file = '.neovim/dbext/profile.json'

    -- Load profile function
    local function load_profile()
      if not vim.fn.filereadable(profile_config_file) then
        return
      end

      vim.g.DbextProfile = vim.fn.json_decode(vim.fn.readfile(profile_config_file))
      local format = 'let g:dbext_default_profile_%s= "type=%s:host=%s:port=%d:user=%s:passwd=%s:dbname=%s"'
      vim.g.dbext_default_profile = vim.g.DbextProfile.default

      for profile, item in pairs(vim.g.DbextProfile.profiles) do
        local host = item.ssh_over and '127.0.0.1' or item.host
        local port = item.ssh_over and 3306 or item.port
        vim.cmd(string.format(format, profile, item.driver, host, port, item.user, item.password, item.db_name))
      end
    end

    -- Profile initialization function
    local function profile_init()
      if not vim.fn.isdirectory('.neovim') then
        vim.fn.system('mkdir -p .neovim/dbext')
      elseif not vim.fn.isdirectory('.neovim/dbext') then
        vim.fn.system('mkdir .neovim/dbext')
      end

      vim.fn.system('cp ' .. vim.g.ROOT_DIR .. '/settings/plugins/dbext.rc.d/profile-sample.json ' .. profile_config_file)
      vim.cmd('edit ' .. profile_config_file)
    end

    -- Port forward function
    local function port_forward(profile_name)
      local profile = vim.g.DbextProfile.profiles[profile_name]
      if not profile.ssh_over then
        _G.Notify(plugin_name, "this profile's ssh_over is false.", "error")
        return
      end

      local cmd = string.format('ssh -f -N -L 3306:%s:%d -i %s %s@%s',
        profile.host, profile.port, profile.ssh_secret_key, profile.ssh_user, profile.ssh_host)
      vim.fn.system(cmd)
    end

    -- Kill port forward process
    local function kill_port_forward_process()
      vim.fn.system("kill `ps aux | grep \"ssh -f\" | grep -v grep | awk '{print $2;}'`")
    end

    -- Prompt for buffer parameters
    local function prompt_for_buffer_parameters()
      if vim.fn.filereadable(profile_config_file) == 0 then
        local answer = vim.fn.confirm("generate profile.json file?", "&Yes\nNo")
        if answer == 2 then
          return
        end
        profile_init()
        return
      elseif not vim.g.DbextProfile then
        load_profile()
      end

      kill_port_forward_process()

      local i = 0
      local profile_list_str = ''
      local profile_num_dict = {}

      for profile, _ in pairs(vim.g.DbextProfile.profiles) do
        i = i + 1
        profile_list_str = profile_list_str .. string.format("%d: %s\n", i, profile)
        profile_num_dict[i] = profile
      end

      local current_pf = vim.fn['DB_listOption']('profile')
      local profile_num = vim.fn.input(string.format("Please select a profile to connect database.\n%sEnter profile [%s] #: ", profile_list_str, current_pf))
      print("\n\n")

      local target_pf_nm = ''
      if #profile_num ~= 0 then
        local num = tonumber(profile_num)
        if not profile_num_dict[num] then
          _G.Notify(plugin_name, "Please enter the correct number.", 'warn')
          return
        end
        target_pf_nm = profile_num_dict[num]
      else
        target_pf_nm = current_pf
      end

      if vim.g.DbextProfile.profiles[target_pf_nm].ssh_over then
        port_forward(target_pf_nm)
      end

      vim.cmd('DBSetOption profile=' .. target_pf_nm)
      vim.cmd('DBCompleteTables')
      _G.Notify(plugin_name, string.format("'%s' profile was connected successfully.", target_pf_nm))
    end

    -- Complete table and notify
    local function complete_table_and_notify()
      vim.cmd('silent DBCompleteTables')
      _G.Notify(plugin_name, 'Load db completed successfully.')
    end

    -- Load profile on setup
    load_profile()

    -- Autocommands
    local dbext_group = vim.api.nvim_create_augroup('Dbext', { clear = true })

    if vim.g.dbext_default_profile and #vim.g.dbext_default_profile ~= 0 then
      vim.api.nvim_create_autocmd('VimEnter', {
        group = dbext_group,
        callback = complete_table_and_notify,
      })
    end

    vim.api.nvim_create_autocmd('VimLeave', {
      group = dbext_group,
      callback = function()
        vim.fn.system("kill `ps aux | grep \"ssh -f\" | grep -v grep | awk '{print $2;}'`")
      end,
    })

    -- Commands
    vim.api.nvim_create_user_command('DbextProfileSet', prompt_for_buffer_parameters, {})
    vim.api.nvim_create_user_command('DbextProfileLoad', load_profile, {})

    -- Key mapping
    -- vim.keymap.set('n', '<Leader>sbp', '<Cmd>DbextProfileSet<CR>')
  end,
}
