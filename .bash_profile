# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bash_profile.pre.bash" ]] && builtin source "$HOME/.fig/shell/bash_profile.pre.bash"
eval "$(rbenv init -)" # rbenv初期化(パスが通る)
eval "$(pyenv init -)"
eval "$(nodenv init -)"
#  macos デフォルトシェルzshの警告削除
export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="/usr/local/opt/mysql/bin:$PATH"
export PATH="$PATH:./node_modules/.bin"
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad #lsで表示される色の変更
export PATH="$PATH:/usr/local/opt/llvm/bin"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export NODE_PATH=`npm bin -g`
export PATH="$PATH:$NODE_PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bash_profile.post.bash" ]] && builtin source "$HOME/.fig/shell/bash_profile.post.bash"
. "$HOME/.cargo/env"
