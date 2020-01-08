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
