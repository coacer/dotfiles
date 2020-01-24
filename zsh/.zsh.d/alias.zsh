function cdls() {
  \cd $1;
  ls -G;
}

alias cd=cdls
alias cdd='cd ~/Desktop'
alias vi='vim -C -u NONE'
alias ..='cd ..'
alias ...='cd ../..'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias ls="ls -GF"
alias ide="~/Scripts/ide.sh"
alias nvis="nvim -S .session.vim"
alias lo="~/Scripts/localhostOpen.sh"
alias t="tmux"
alias ta="tmux a"
alias tn="tmux new -s"
alias tk="~/Scripts/tmuxKill.sh"
alias giti="~/Scripts/CreateGitIgnoreFile/index.js"
