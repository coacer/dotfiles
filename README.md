# dotfiles
```
 $ cd #ホームディレクトリに移動
 $ git clone https://github.com/coacer/dotfiles.git
```

## .vimrcセッティング
- dein.vim(プラグインパッケージ管理ツール)インストール
```
$ mkdir -p ~/.vim/bundle #ディレクトリが存在しない場合
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ sh ./installer.sh ~/.vim/bundle
```

- シンボリックリンク作成
```
 $ ln -s ~/dotfiles/.vimrc ~/.vimrc
```

- プラグインのインストール
```
 $ vim #vimを起動すると自動でインストール作業が開始される
```

dein.vim引用
https://github.com/Shougo/dein.vim
