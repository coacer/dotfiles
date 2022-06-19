lua << EOF
require("scrollbar").setup({
    handle = {
        color = '#888888',
    },
    marks = {
        Search = { color = '#FFD700' },
        Error = { color = '#FFFFFF' },
        Warn = { color = '#FFFFFF' },
        Info = { color = '#FFFFFF' },
        Hint = { color = '#FFFFFF' },
        Misc = { color = '#FFFFFF' },
    }
})
require("scrollbar.handlers.search").setup()
EOF
