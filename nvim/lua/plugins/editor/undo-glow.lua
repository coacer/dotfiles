-- Visual glow effect for undo/redo and other operations
return {
  "y3owk1n/undo-glow.nvim",
  event = { "VeryLazy" },
  ---@type UndoGlow.Config
  opts = {
    animation = {
      enabled = true,
      duration = 300,
      animation_type = "zoom",
      window_scoped = true,
    },
    highlights = {
      undo = {
        hl_color = { bg = "#35445b" }, -- Dark muted red
      },
      redo = {
        hl_color = { bg = "#35445b" }, -- Dark muted green
      },
      yank = {
        hl_color = { bg = "#35445b" }, -- Dark muted yellow
      },
      paste = {
       hl_color = { bg = "#35445b" }, -- Dark muted cyan
      },
      search = {
        hl_color = { bg = "#35445b" }, -- Dark muted purple
      },
      comment = {
        hl_color = { bg = "#35445b" }, -- Dark muted orange
      },
      cursor = {
        hl_color = { bg = "#35445b" }, -- Dark muted pink
      },
    },
    priority = 2048 * 3,
  },
  keys = {
    {
      "u",
      function()
        require("undo-glow").undo()
      end,
      mode = "n",
      desc = "Undo with highlight",
      noremap = true,
    },
    {
      "<c-r>",
      function()
        require("undo-glow").redo()
      end,
      mode = "n",
      desc = "Redo with highlight",
      noremap = true,
    },
    {
      "p",
      function()
        require("undo-glow").paste_below()
      end,
      mode = "n",
      desc = "Paste below with highlight",
      noremap = true,
    },
    {
      "P",
      function()
        require("undo-glow").paste_above()
      end,
      mode = "n",
      desc = "Paste above with highlight",
      noremap = true,
    },
    {
      "n",
      function()
        require("undo-glow").search_next({
          animation = {
            animation_type = "strobe",
          },
        })
      end,
      mode = "n",
      desc = "Search next with highlight",
      noremap = true,
    },
    {
      "N",
      function()
        require("undo-glow").search_prev({
          animation = {
            animation_type = "strobe",
          },
        })
      end,
      mode = "n",
      desc = "Search prev with highlight",
      noremap = true,
    },
    {
      "*",
      function()
        require("undo-glow").search_star({
          animation = {
            animation_type = "strobe",
          },
        })
      end,
      mode = "n",
      desc = "Search star with highlight",
      noremap = true,
    },
    {
      "#",
      function()
        require("undo-glow").search_hash({
          animation = {
            animation_type = "strobe",
          },
        })
      end,
      mode = "n",
      desc = "Search hash with highlight",
      noremap = true,
    },
  },
  config = function(_, opts)
    require("undo-glow").setup(opts)

    vim.api.nvim_create_autocmd("TextYankPost", {
     desc = "Highlight when yanking (copying) text",
     callback = function()
      require("undo-glow").yank()
     end,
    })
  end,
}
