# =============================================================================
# Fish Shell Configuration
# =============================================================================

# --------------------------------------------------
# Environment Variables
# --------------------------------------------------

# Homebrew
set -gx PATH /opt/homebrew/bin $PATH

# MySQL
set -gx PATH /usr/local/opt/mysql/bin $PATH

# Node.js
set -gx PATH ./node_modules/.bin $PATH
set -gx NODE_PATH (npm bin -g 2>/dev/null)
if test -n "$NODE_PATH"
    set -gx PATH $NODE_PATH $PATH
end

# LLVM
set -gx PATH /usr/local/opt/llvm/bin $PATH

# Go
set -gx GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH
set -gx GOENV_ROOT $HOME/.goenv
set -gx PATH $GOENV_ROOT/bin $PATH

# Dart/Flutter
set -gx PATH $HOME/.pub-cache/bin $PATH
set -gx PATH $HOME/flutter/bin $PATH

# .NET
set -gx PATH $HOME/.dotnet/tools $PATH

# Android
set -gx PATH $HOME/Library/Android/sdk/cmdline-tools/latest/bin $PATH

# Scala
set -gx PATH /opt/homebrew/opt/scala@2.12/bin $PATH
set -gx SBT_OPTS "-Xms1G -Xmx2G -XX:MetaspaceSize=256M -XX:MaxMetaspaceSize=768M -XX:+UseParallelGC -Duser.timezone=UTC -Dfile.encoding=UTF8"

# Java
set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

# Python (pyenv)
set -gx PYENV_ROOT $HOME/.pyenv
set -gx PATH $PYENV_ROOT/shims $PATH

# Neovim
set -gx NVIM_NODE_LOG_FILE $HOME/.local/share/nvim/rplugin/log/node.log

# Coursier
set -gx PATH $HOME/Library/Application\ Support/Coursier/bin $PATH

# --------------------------------------------------
# Version Managers Initialization
# --------------------------------------------------

# rbenv
if type -q rbenv
    rbenv init - fish | source
end

# pyenv
if type -q pyenv
    pyenv init - fish | source
    if type -q pyenv-virtualenv-init
        pyenv virtualenv-init - fish | source
    end
end

# nodenv
if type -q nodenv
    nodenv init - fish | source
end

# goenv
if type -q goenv
    goenv init - fish | source
end

# --------------------------------------------------
# Autojump Integration
# --------------------------------------------------

if test -f /opt/homebrew/share/autojump/autojump.fish
    source /opt/homebrew/share/autojump/autojump.fish
end

# --------------------------------------------------
# Amazon Q Integration
# --------------------------------------------------

if test -f "$HOME/Library/Application Support/amazon-q/shell/config.fish"
    source "$HOME/Library/Application Support/amazon-q/shell/config.fish"
end

# --------------------------------------------------
# Kubectl Completion
# --------------------------------------------------

if type -q kubectl
    kubectl completion fish | source
end

# --------------------------------------------------
# Fish Options
# --------------------------------------------------

# Disable the greeting message
set -g fish_greeting

# Enable color support
set -g fish_color_command blue
set -g fish_color_param normal
set -g fish_color_error red
set -g fish_color_quote yellow

# Added by Windsurf
fish_add_path /Users/nakagamiyuki/.codeium/windsurf/bin

# Added by Antigravity
fish_add_path /Users/nakagamiyuki/.antigravity/antigravity/bin
