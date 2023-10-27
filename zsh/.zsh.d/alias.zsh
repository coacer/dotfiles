function cdls() {
  \cd $1;
  ls -lGh;
}

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
alias nnvim="~/nvim-osx64/bin/nvim"
alias nnvis="nnvim -S .session.vim"
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
alias vc="networksetup -connectpppoeservice sonic"
alias vd="networksetup -disconnectpppoeservice sonic"
alias airp="BluetoothConnector --connect AC-90-85-DF-A3-F7 --notify"
alias dairp="BluetoothConnector AC-90-85-DF-A3-F7 --notify"

# Dynalyst
alias sal="saml2aws login -a conv-dev"
alias aip="saml2aws login -a conv-dev && ~/dev/dynalyst/dynalyst-mgmt-fw-tool/bin/dynalyst-mgmt-fw-tool allow-my-ip"
alias sbtd="sbt -Dconfig.file=`pwd`/server/dashboard/conf/development.conf"
alias gitc="~/.bin/dynalyst-git-checkout.sh"
alias gitm="git fetch upstream && git merge upstream/master"
