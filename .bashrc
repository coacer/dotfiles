# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bashrc.pre.bash" ]] && builtin source "$HOME/.fig/shell/bashrc.pre.bash"
# プロンプトの表示変更、gitのブランチ表示、git補完機能
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
# export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]\[\033[33m\] [\D{%y/%m/%d %H:%M:%S}]\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '
export NVIM_NODE_LOG_FILE="${HOME}/.local/share/nvim/rplugin/log/node.log"

# ログイン時以外でプロンプト表示の上に空行挿入
# function add_line {
#   if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
#     PS1_NEWLINE_LOGIN=true
#   else
#     printf '\n\n'
#   fi
# }
#
# PROMPT_COMMAND='add_line'
function cdls() {
 \cd $1;
 ls -G;
}

# エイリアス
alias cd=cdls
alias cdd='cd ~/Desktop'
alias vi='vim -C -u NONE'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias la='ls -a'
alias ll='ls -lh'
alias lla='ls -lha'
alias ls="ls -GF"
alias ide="~/.bin/ide.sh"
alias nvis="nvim -S .session.vim"
alias lo="~/.bin/localhostOpen.sh"
alias t="tmux"
alias ta="tmux a"
alias tn="tmux new -s"
alias ts="tmux source ~/.tmux.conf"
alias te="nvim ~/.tmux.conf"
alias tk="~/.bin/tmuxKill.sh"
alias giti="~/.bin/CreateGitIgnoreFile/index.js"
alias lg="lazygit"
alias ld="lazydocker"
alias cdt="cd ~/dotfiles"
alias esl="~/.bin/setESlintPrettier/init.sh"
alias tf="terraform"
alias tfw="terraform workspace"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# デフォルト設定
export FZF_DEFAULT_OPTS="--reverse --margin=1,3 --inline-info --prompt='Search: ' --preview 'bat  --color=always --style=header,grid --line-range :100 {}' --color=fg+:85,bg+:23,fg:247"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
# 隠しファイルを対象とする(fzf.vim対応)
export FZF_DEFAULT_COMMAND="find . -path '*/\.*' -type d -prune -o -type f -print -o -type l -print 2> /dev/null | sed s/^..//"

# 一発でディレクトリ移動
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# ブランチを選択してcheckout
fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bashrc.post.bash" ]] && builtin source "$HOME/.fig/shell/bashrc.post.bash"
. "$HOME/.cargo/env"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path bash)"
