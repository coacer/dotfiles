-- Auto save plugin - automatically saves files
return {
  "pocco81/auto-save.nvim",
  ft = { "markdown" }, -- markdownのみ適用
  opts = {
    enabled = true,
    execution_message = {
      message = function() -- message to print on save
        return "" -- disable message
      end,
      dim = 0.18, -- dim the color of `message`
      cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
    },
  },
}

