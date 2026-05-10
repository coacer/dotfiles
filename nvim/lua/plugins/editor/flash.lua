-- Fast and intuitive cursor movement
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    -- デフォルト設定で十分ですが、カスタマイズ可能
    labels = "asdfghjkl;",
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
      uppercase = false,
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
        enabled = false, -- f, t, F, Tの移動時にflashを無効化
        jump_labels = true,
      },
    },
  },
  keys = {
    -- easymotionの<Leader>jの代替として<Leader>jを使用
    { "<Leader>j", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
  },
}
