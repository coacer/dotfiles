-- Language support plugins
return {
  -- Web development
  {
    'mattn/emmet-vim',
    ft = { 'html', 'eruby', 'javascriptreact', 'tsx', 'php', 'vue' },
    config = function()
      vim.g.user_emmet_leader_key = '<C-j>'
      vim.g.user_emmet_mode = 'i' -- only enable insert mode functions
    end,
  },

  -- JavaScript/TypeScript (handled by nvim-treesitter)

  -- Vue.js
  {
    'posva/vim-vue',
    ft = { 'vue' },
    config = function()
      -- Fix heavy operations
      vim.g.vue_disable_pre_processors = 1
      
      -- Syntax sync from start for Vue files
      vim.api.nvim_create_augroup('VimVue', { clear = true })
      vim.api.nvim_create_autocmd('FileType', {
        group = 'VimVue',
        pattern = 'vue',
        command = 'syntax sync fromstart',
      })
    end,
  },

  -- CSS/SCSS
  { 'cespare/vim-toml', ft = { 'toml' } },

  -- PHP
  { 'jwalton512/vim-blade', ft = { 'blade' } },
  {
    'joonty/vdebug',
    ft = { 'php' },
    config = function()
      local vdebug_file = '.vdebug.conf.vim'
      
      -- Load config file if it exists
      if vim.fn.filereadable(vdebug_file) == 1 then
        vim.cmd('source ' .. vdebug_file)
        
        -- Configure vdebug options using loaded variables
        vim.g.vdebug_options = {
          port = vim.g.xdebug_port,
          timeout = 20,
          on_close = 'detach',
          break_on_open = 0,
          remote_path = "",
          local_path = "",
          debug_window_level = 0,
          debug_file_level = 0,
          debug_file = "",
          path_maps = {
            [vim.g.xdebug_guest_path] = vim.g.xdebug_host_path,
          },
          window_arrangement = { "DebuggerWatch", "DebuggerStack" }
        }
        
        -- Highlight settings
        vim.cmd('highlight DbgCurrentLine guibg=#774449')
        vim.cmd('highlight DbgCurrentSign guibg=#774449')
        vim.cmd('highlight DbgBreakptLine guibg=#395640')
        vim.cmd('highlight DbgBreakptSign guibg=#395640')
        
        -- Key mappings
        vim.keymap.set('n', '<Leader>x', '<Nop>')  -- Disable Leader+x
        vim.keymap.set('n', '<Leader>xx', '<F10>') -- Toggle breakpoint
        vim.keymap.set('n', '<Leader>xs', '<F5>')  -- Start debug
        vim.keymap.set('n', '<Leader>xd', '<F6>')  -- Stop debug
        vim.keymap.set('n', '<Leader>xj', '<F2>')  -- Step over
        vim.keymap.set('n', '<Leader>xl', '<F3>')  -- Step in
        vim.keymap.set('n', '<Leader>xh', '<F4>')  -- Step out
        vim.keymap.set('n', '<Leader>xe', '<F12>') -- Evaluate
      end
    end,
  },

  -- Markdown
  {
    'iamcco/markdown-preview.nvim',
    ft = { 'markdown', 'pandoc.markdown', 'rmd' },
    build = 'sh -c "cd app & yarn install"',
    config = function()
      -- Configuration options
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_command_for_global = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_open_ip = ''
      vim.g.mkdp_browser = ''
      vim.g.mkdp_echo_preview_url = 0
      vim.g.mkdp_browserfunc = ''
      
      -- Markdown render options
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = {},
        maid = {},
        disable_sync_scroll = 0,
        sync_scroll_type = 'middle',
        hide_yaml_meta = 1,
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false
      }
      
      -- Custom styles and port
      vim.g.mkdp_markdown_css = ''
      vim.g.mkdp_highlight_css = ''
      vim.g.mkdp_port = ''
      vim.g.mkdp_page_title = '「${name}」'
      
      -- Confirm preview function
      local function confirm_preview()
        local answer = vim.fn.confirm("Do you want to preview?", "&Yes\nNo")
        if answer == 1 then
          vim.cmd('MarkdownPreview')
        end
      end
      
      _G.ConfirmPreview = confirm_preview
    end,
  },

  -- Go
  { 'mattn/vim-goimports', ft = { 'go' } },

  -- Dart/Flutter
  {
    'dart-lang/dart-vim-plugin',
    ft = { 'dart' },
    config = function()
      vim.g.dart_format_on_save = true
    end,
  },
  {
    'thosakwe/vim-flutter',
    ft = { 'dart' },
    config = function()
      -- Set default flutter option if not exists
      if not vim.g.flutter_option then
        vim.g.flutter_option = ''
      end
      
      -- Flutter commands
      vim.keymap.set('n', '<Leader>DD', '<Cmd>FlutterRun ' .. vim.g.flutter_option .. '<CR>')
      vim.keymap.set('n', '<Leader>DQ', '<Cmd>FlutterQuit<CR>')
      vim.keymap.set('n', '<Leader>DR', '<Cmd>FlutterHotRestart<CR>')
    end,
  },

  -- Swift
  'keith/swift.vim',

  -- CoffeeScript
  { 'kchmck/vim-coffee-script', ft = { 'coffee' } },

  -- Terraform
  { 'hashivim/vim-terraform', ft = { 'terraform' } },

  -- Protocol Buffers
  { 'uarun/vim-protobuf', ft = { 'proto' } },

  -- GraphQL
  {
    'jparise/vim-graphql',
    ft = { 'graphql' },
    config = function()
      vim.g.graphql_javascript_tags = { '' }
    end,
  },

  -- Rails
  'tpope/vim-rails',
}