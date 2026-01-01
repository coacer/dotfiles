-- TreeSitter for enhanced syntax highlighting and parsing
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'javascript',
        'typescript',
        'tsx',
        'html',
        'css',
        'scss',
        'json',
        'lua',
        'vim',
        'vimdoc',
        'yaml',
        'toml',
        'bash',
        'python',
        'go',
        'rust',
        'php',
        'vue',
        'dart',
        'swift',
        'ruby',
        'java',
        'kotlin',
        'scala',
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = { 'markdown' },
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = '<C-s>',
          node_decremental = '<C-backspace>',
        },
      },
    })
  end,
}
