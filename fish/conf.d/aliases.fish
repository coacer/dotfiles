# =============================================================================
# Fish Shell Aliases
# Migrated from zsh/.zsh.d/alias.zsh
# =============================================================================

# --------------------------------------------------
# Directory Navigation
# --------------------------------------------------

# cd with ls (function instead of alias for better fish compatibility)
# Note: Suppress ls output in Neovim to prevent interference with git-blame.nvim
function cd
    builtin cd $argv
    and if not set -q NVIM
        ls -lGh
    end
end

alias cdd='cd ~/Desktop'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cdt='cd ~/dotfiles'

# --------------------------------------------------
# ls Commands
# --------------------------------------------------

alias ls='ls -GF'
alias la='ls -a'
alias ll='ls -lh'
alias lla='ls -lha'

# --------------------------------------------------
# Vim/Neovim
# --------------------------------------------------

alias vi='vim -C -u NONE'
alias nvis='nvim -S .session.vim'
alias nnvim='~/nvim-osx64/bin/nvim'
alias nnvis='nnvim -S .session.vim'

# --------------------------------------------------
# Tmux
# --------------------------------------------------

alias t='tmux'
alias ta='tmux a'
alias tn='tmux new -s'
alias ts='tmux source ~/.tmux.conf'
alias te='nvim ~/.tmux.conf'
alias tk='~/.bin/tmuxKill.sh'

# --------------------------------------------------
# Git Tools
# --------------------------------------------------

alias lg='lazygit'
alias ld='lazydocker'
alias giti='~/.bin/CreateGitIgnoreFile/index.js'
alias gitc='~/.bin/dynalyst-git-checkout.sh'
alias gitm='git fetch upstream && git merge upstream/master'

# --------------------------------------------------
# Development Tools
# --------------------------------------------------

alias ide='~/.bin/ide.sh'
alias lo='~/.bin/localhostOpen.sh'
alias esl='~/.bin/setESlintPrettier/init.sh'

# --------------------------------------------------
# Terraform
# --------------------------------------------------

alias tf='terraform'
alias tfw='terraform workspace'

# --------------------------------------------------
# Network/VPN
# --------------------------------------------------

alias vc='networksetup -connectpppoeservice sonic'
alias vd='networksetup -disconnectpppoeservice sonic'

# --------------------------------------------------
# Bluetooth (AirPods)
# --------------------------------------------------

alias airp='BluetoothConnector --connect AC-90-85-DF-A3-F7 --notify'
alias dairp='BluetoothConnector AC-90-85-DF-A3-F7 --notify'

# --------------------------------------------------
# Project-specific (Dynalyst)
# --------------------------------------------------

alias sal='saml2aws login -a conv-dev'
alias aip='saml2aws login -a conv-dev && ~/dev/dynalyst/dynalyst-mgmt-fw-tool/bin/dynalyst-mgmt-fw-tool allow-my-ip'
alias sbtd='sbt -Dconfig.file=(pwd)/server/dashboard/conf/development.conf'

# --------------------------------------------------
# Directory Tree (custom implementation)
# --------------------------------------------------

function tree
    pwd
    find . | sort | sed '1d;s/^\\.//;s/\\/\\([^/]*\\)\$/|--\\1/;s/\\/[^/|]*/| /g'
end
