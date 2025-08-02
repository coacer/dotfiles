# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zprofile.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.pre.zsh"
export PATH="/usr/local/opt/mysql/bin:$PATH"
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:/usr/local/opt/llvm/bin"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$HOME/.dotnet/tools:$PATH"
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"

eval "$(rbenv init -)" # rbenv初期化(パスが通る)
eval "$(pyenv init -)"
eval "$(nodenv init -)"
eval "$(goenv init -)"
# export GO111MODULE=auto

export NODE_PATH=`npm bin --location=global`
# if output warning this comment in.
export NODE_PATH=`npm bin -g`
export PATH="$PATH:$NODE_PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
export NVIM_NODE_LOG_FILE="${HOME}/.local/share/nvim/rplugin/log/node.log"
export PATH="$PATH:$HOME/flutter/bin"
export PATH="$PATH:$HOME/Library/Android/sdk/cmdline-tools/latest/bin"
export SBT_OPTS="-Xms1G -Xmx2G -XX:MetaspaceSize=256M -XX:MaxMetaspaceSize=768M -XX:+UseParallelGC -Duser.timezone=UTC -Dfile.encoding=UTF8"
export PATH="/opt/homebrew/opt/scala@2.12/bin:$PATH"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# >>> coursier install directory >>>
export PATH="$PATH:/Users/s15022/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zprofile.post.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.post.zsh"
