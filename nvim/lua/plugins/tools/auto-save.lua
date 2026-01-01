-- Auto save plugin - automatically saves files
return {
  "pocco81/auto-save.nvim",
  opts = {
    enabled = true,
    execution_message = {
      message = function() -- message to print on save
        return "" -- disable message
      end,
      dim = 0.18, -- dim the color of `message`
      cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
    },
    condition = function()
      local target_dirs = {
        vim.fn.expand("~/Library/Mobile Documents/iCloud~md~obsidian/Documents"),
        -- 追加したいディレクトリをここに記述
      }
      local filepath = vim.fn.expand("%:p")
      for _, dir in ipairs(target_dirs) do
        if filepath:find(dir, 1, true) then
          return true
        end
      end
      return false
    end,
  },
}

