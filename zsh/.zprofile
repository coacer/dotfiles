eval "$(rbenv init -)" # rbenv初期化(パスが通る)
eval "$(pyenv init -)"
eval "$(nodenv init -)"
export PATH="/usr/local/opt/mysql/bin:$PATH"
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:/usr/local/opt/llvm/bin"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export NODE_PATH=`npm bin -g`
export PATH="$PATH:$NODE_PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

