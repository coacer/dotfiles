-- Notification UI
return {
  'rcarriga/nvim-notify',
  config = function()
    require('notify').setup({
      background_colour = "Normal",
      fps = 60,
      icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = ""
      },
      level = 2,
      minimum_width = 65,
      render = "default",
      stages = "slide",
      timeout = 6000
    })

    -- Set as default notify function
    vim.notify = require('notify')

    -- Global notify function
    _G.Notify = function(title, msg, type)
      type = type or 'info'
      require('notify')(msg, type, { title = title })
    end

    -- Highlight
    vim.cmd('highlight NotifyERRORTitle  guifg=#FFFFFF')
  end,
}
