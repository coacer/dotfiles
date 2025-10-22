# Fish Shell Configuration

このディレクトリには、Fish Shell の設定ファイルが含まれています。
Zsh の設定から移植されています。

## ディレクトリ構造

```
fish/
├── config.fish          # メイン設定ファイル
├── conf.d/              # 追加設定ディレクトリ
│   ├── aliases.fish     # エイリアス定義
│   ├── git_prompt.fish  # Gitプロンプト設定
│   └── fzf.fish         # FZF統合設定
└── README.md            # このファイル
```

## セットアップ手順

### 1. Fish のインストール (既に完了)

```bash
brew install fish
```

### 2. シンボリックリンクの作成 (既に完了)

```bash
ln -sf ~/dotfiles/fish ~/.config/fish
```

### 3. /etc/shells に Fish を追加

```bash
echo '/opt/homebrew/bin/fish' | sudo tee -a /etc/shells
```

### 4. デフォルトシェルを Fish に変更

```bash
chsh -s /opt/homebrew/bin/fish
```

### 5. ターミナルの再起動

新しいターミナルセッションを開くと、Fish シェルが起動します。

## 移植された機能

### エイリアス (aliases.fish)
- ディレクトリナビゲーション: `cd`, `cdd`, `..`, `...`, `....`, `cdt`
- ls コマンド: `ls`, `la`, `ll`, `lla`
- Vim/Neovim: `vi`, `nvis`, `nnvim`, `nnvis`
- Tmux: `t`, `ta`, `tn`, `ts`, `te`, `tk`
- Git ツール: `lg`, `ld`, `giti`, `gitc`, `gitm`
- その他のツール: `ide`, `lo`, `esl`, `tf`, `tfw`

### Git プロンプト (git_prompt.fish)
- ブランチ名の表示
- 未ステージ変更: 赤色 `**`
- ステージ済み変更: 黄色 `++`
- クリーンな状態: 緑色
- Upstream 状態表示

### FZF 統合 (fzf.fish)
- `fd`: ディレクトリをファジー検索して移動
- `fbr`: Git ブランチをファジー検索してチェックアウト
- プレビュー機能付き

## 環境変数

以下の環境変数が設定されています:

- **Homebrew**: `/opt/homebrew/bin`
- **Node.js**: `./node_modules/.bin`, npm global
- **Go**: `$GOPATH/bin`, `$GOENV_ROOT/bin`
- **Python**: `$PYENV_ROOT/shims`
- **Ruby**: rbenv
- **Flutter/Dart**: `$HOME/flutter/bin`, `$HOME/.pub-cache/bin`
- **Java**: `$JAVA_HOME`
- **Scala**: SBT オプション

## バージョン管理ツールの初期化

以下のバージョン管理ツールが自動初期化されます:

- rbenv
- pyenv (+ pyenv-virtualenv)
- nodenv
- goenv

## 注意事項

- Zsh 設定は削除せず、Fish と併存させています
- `cd` 関数は自動的に `ls -lGh` を実行します (Zsh の動作を踏襲)
- Fish は POSIX 互換ではないため、一部のスクリプトは Bash/Zsh で実行する必要がある場合があります

## トラブルシューティング

### FZF が動作しない場合

```bash
# FZF のキーバインディングをインストール
$(brew --prefix)/opt/fzf/install
```

### Autojump が動作しない場合

```bash
brew install autojump
```

### バージョン管理ツールが初期化されない場合

各ツールが正しくインストールされているか確認してください:

```bash
which rbenv pyenv nodenv goenv
```
