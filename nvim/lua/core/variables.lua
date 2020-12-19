local g = vim.g

HOME = os.getenv('HOME')
ROOT_DIR     = HOME .. '/.config/nvim'
SESSION_FILE = '.session.vim'

g.mapleader         = ' '
g.python_host_prog  = HOME .. '/.pyenv/versions/py2neovim/bin/python'
g.python3_host_prog = HOME .. '/.pyenv/versions/py3neovim/bin/python'
g.ruby_host_prog    = HOME .. '/.rbenv/versions/2.7.1/bin/neovim-ruby-host'
g.node_host_prog    = HOME .. '/.nodenv/versions/12.16.3/bin/neovim-node-host'
