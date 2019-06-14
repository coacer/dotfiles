eval "$(rbenv init -)"
export PATH="/usr/local/opt/mysql/bin:$PATH"
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad #lsで表示される色の変更

# プロンプトの表示変更、gitのブランチ表示、git補完機能
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
# export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[33m\] [\D{%y/%m/%d %H:%M:%S}]\[\033[00m\]\n\$ '

# ログイン時以外でプロンプト表示の上に空行挿入
function add_line {
  if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}
PROMPT_COMMAND='add_line'

# エイリアス
alias t='~/Script/createTerminalAtCurrentDirectory.applescript'
