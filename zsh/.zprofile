eval "$(rbenv init -)" # rbenv初期化(パスが通る)
eval "$(pyenv init -)"
eval "$(nodenv init -)"
# eval "$(goenv init -)"
# export GO111MODULE=auto

export PATH="/usr/local/opt/mysql/bin:$PATH"
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:/usr/local/opt/llvm/bin"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export NODE_PATH=`npm bin -g`
export PATH="$PATH:$NODE_PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
export NVIM_NODE_LOG_FILE="${HOME}/.local/share/nvim/rplugin/log/node.log"
export PATH="$PATH:$HOME/flutter/bin"
export PATH="$PATH:$HOME/Library/Android/sdk/cmdline-tools/latest/bin"
export SBT_OPTS="-Xms1G -Xmx2G -XX:MetaspaceSize=256M -XX:MaxMetaspaceSize=768M -XX:+UseParallelGC -Duser.timezone=UTC -Dfile.encoding=UTF8"
export PATH="/usr/local/opt/scala@2.11/bin:$PATH"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
