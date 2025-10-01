-- グローバル変数の設定
vim.g.ROOT_DIR = vim.fn.expand('~/.config/nvim')
vim.g.mapleader = ' '

-- ダイナミック プロバイダ
vim.g.python_host_prog = vim.fn.expand('~/.pyenv/versions/py2neovim/bin/python')
vim.g.python3_host_prog = vim.fn.expand('~/.pyenv/versions/py3neovim/bin/python')
vim.g.ruby_host_prog = vim.fn.expand('~/.rbenv/versions/3.2.2/bin/neovim-ruby-host')
vim.g.node_host_prog = vim.fn.expand('~/.nodenv/versions/20.9.0/bin/neovim-node-host')
