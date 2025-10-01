-- Markdown support
return {
  -- Markdown preview
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

  -- Markdown preview in neovim
  {
    'OXY2DEV/markview.nvim',
    lazy = false,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require('markview').setup({
        experimental = {
          check_rtp_message = false
        },
      })
    end,
  },
}
