#!/bin/zsh

# ==== シンボリックリンク ====
rm ~/.zshrc;
rm ~/.bash_profile;
rm ~/.bashrc;
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc;
ln -s ~/dotfiles/zsh/.zsh.d ~/.zsh.d;
ln -s ~/dotfiles/.bash_profile ~/.bash_profile;
ln -s ~/dotfiles/.bashrc ~/.bashrc;
ln -s ~/dotfiles/.emacs.d ~/.emacs.d;
ln -s ~/dotfiles/.gitconfig ~/.gitconfig;
ln -s ~/dotfiles/.tigrc ~/.tigrc;
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf;
mkdir ~/.config;
ln -s ~/dotfiles/nvim ~/.config/nvim;
ln -s ~/dotfiles/.vimrc ~/.vimrc;
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -s ~/dotfiles/.bin ~/.bin
ln -s ~/dotfiles/.ideavimrc ~/.ideavimrc
ln -s ~/dotfiles/zsh/.zprofile ~/.zprofile

# ==== Homebrew ====
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)";

# for dotnet-sdk
sudo xcodebuild -license accept

brew update;
brew install vim neovim emacs fzf git hub docker lazydocker lazygit tig \
  tree autojump composer awscli rbenv pyenv pyenv-virtualenv nodenv bat luarocks jq asdf gopls mysql ripgrep;
brew install tmux --HEAD
brew install docker iterm2 clipy homebrew/cask-versions/sequel-pro-nightly font-hack-nerd-font dotnet-sdk --cask;
brew tap homebrew/cask-fonts dart-lang/dart

dotnet tool install --global csharp-ls

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

# kubectl


# 読み込み
source ~/.zshrc;
# x86
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl
# arm64
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/arm64/kubectl"

sudo mv kubectl /usr/local/bin
sudo chmod +x /usr/local/bin/kubectl

# ==== Neovim ====
# ==== dein.vimインストール ====
mkdir -p ~/.cache/dein;
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh;
sh ./installer.sh ~/.cache/dein;
rm installer.sh;


# ==== ダイナミックプロバイダの設定 ====

# == Python ==
# 最新の安定版のバージョンをインストール
python2=$(pyenv install -l | grep -v '[a-zA-Z]' | grep -e '\s2\.?*' | tail -1);
python3=$(pyenv install -l | grep -v '[a-zA-Z]' | grep -e '\s3\.?*' | tail -1);
pyenv install $python2;
pyenv install $python3;
pyenv rehash;
# インストールしたバージョンでvirtualenvを設定
pyenv virtualenv $python2 py2neovim;
pyenv virtualenv $python3 py3neovim;
# それぞれのvirtualenv内でneovimをインストール
pyenv activate py2neovim;
pip install neovim;
pyenv activate py3neovim;
pip install neovim;


# == Ruby ==
# 最新の安定版のバージョンをインストール
ruby=$(rbenv install -l | grep -v '[a-zA-Z]' | grep -e '^2\.?*' | tail -1);
rbenv install $ruby;
rbenv rehash;
rbenv global $ruby;
gem install neovim;


# == Node.js ==
# 最新の安定版のバージョンをインストール
node=$(nodenv install -l | grep -v '[a-zA-Z]' | grep -e '^12\.?*' | tail -1);
nodenv install $node;
nodenv rehash;
nodenv global $node;
npm install -g neovim;


npm install -g diagnostic-languageserver
