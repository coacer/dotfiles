-- Auto-close inactive buffers
return {
  "chrisgrieser/nvim-early-retirement",
  config = true,
  event = "VeryLazy",
  opts = {
    retirementAgeMins = 180,
  },
}
