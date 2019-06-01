eval "$(rbenv init -)"

# プロンプトの表示変更、gitのブランチ表示、git補完機能
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '

# エイリアス
alias ypwd='pwd | pbcopy; pwd; echo is copied!!'
alias cdp='cd `pbpaste`'
