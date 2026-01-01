return {
  "sontungexpt/url-open",
  event = "VeryLazy",
  cmd = "URLOpenUnderCursor",
  config = function()
    local status_ok, url_open = pcall(require, "url-open")
    if not status_ok then
      return
    end
    url_open.setup({
      highlight_url = {
        all_urls = {
          enabled = true,
          fg = "#21d5ff",
          underline = true,
        },
      },
    })
  end,
  keys = {
    { "gx", "<cmd>URLOpenUnderCursor<cr>", desc = "Open URL under cursor" },
    { "<2-LeftMouse>", "<cmd>URLOpenUnderCursor<cr>", desc = "Open URL with double click" },
  },
}
