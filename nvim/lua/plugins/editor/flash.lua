-- Fast and intuitive cursor movement
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    -- デフォルト設定で十分ですが、カスタマイズ可能
    labels = "asdfghjklqwertyuiopzxcvbnm",
    search = {
      multi_window = true,
      forward = true,
      wrap = true,
    },
    jump = {
      jumplist = true,
      pos = "start",
      history = false,
      register = false,
      nohlsearch = false,
    },
    label = {
      uppercase = true,
      rainbow = {
        enabled = false,
        shade = 5,
      },
    },
    modes = {
      search = {
        enabled = false,
      },
      char = {
        enabled = true,
        jump_labels = true,
      },
    },
  },
  keys = {
    -- easymotionの<Leader>jの代替として<Leader>jを使用
    { "<Leader>j", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
  },
}
