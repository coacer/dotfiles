-- Obsidian bridge plugin - mirrors Neovim navigation events in Obsidian
return {
  "oflisback/obsidian-bridge.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  lazy = true,
  event = {
    "BufReadPre *.md",
    "BufNewFile *.md",
  },
  opts = {
    scroll_sync = true,
  },
}
