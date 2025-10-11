# CLAUDE.md

このファイルは、Claude Code (claude.ai/code) がこのリポジトリで作業する際のガイダンスを提供します。

## リポジトリ概要

macOS用の開発環境セットアップのための個人用dotfilesリポジトリです。主にNeovim（Luaで設定）、Zsh、tmux、および各種コマンドラインツールの設定が含まれています。

## セットアップとインストール

### 初期セットアップ
```bash
cd ~
git clone https://github.com/coacer/dotfiles.git
cd dotfiles
chmod 744 install.sh
./install.sh
```

`install.sh`スクリプトの実行内容:
- `~/dotfiles`からホームディレクトリへシンボリックリンクを作成
- Homebrewと必須パッケージをインストール（vim、neovim、fzf、git、docker、lazygit、tig、tmuxなど）
- 言語環境のセットアップ（pyenv経由でPython、rbenv経由でRuby、nodenv経由でNode.js）
- Neovimの設定（レガシーのdein.vimとlazy.nvim）
- tmuxプラグインマネージャー（tpm）のインストール

### 主要なシンボリックリンク
- `~/.config/nvim` → `~/dotfiles/nvim`
- `~/.zshrc` → `~/dotfiles/zsh/.zshrc`
- `~/.zprofile` → `~/dotfiles/zsh/.zprofile`
- `~/.tmux.conf` → `~/dotfiles/.tmux.conf`
- `~/.gitconfig` → `~/dotfiles/.gitconfig`
- `~/.vimrc` → `~/dotfiles/.vimrc`

## Neovim設定アーキテクチャ

### ディレクトリ構造
Neovim設定は**lazy.nvim**をプラグインマネージャーとして使用し、モジュール化されたLuaベースのアーキテクチャです:

```
nvim/
├── init.lua                 # エントリーポイント、configとutilsを読み込み
├── lua/
│   ├── config/              # コア設定モジュール
│   │   ├── init.lua         # 全設定モジュールを順番に読み込み
│   │   ├── variables.lua    # Vim変数
│   │   ├── options.lua      # Vimオプション
│   │   ├── lazy.lua         # lazy.nvimのブートストラップ
│   │   ├── highlights.lua   # シンタックスハイライト設定
│   │   └── keymaps.lua      # キーマッピング
│   ├── plugins/             # プラグイン定義
│   │   ├── init.lua         # 全プラグインサブディレクトリを自動インポート
│   │   ├── ai/              # AI関連プラグイン
│   │   ├── colorscheme/     # カラースキームプラグイン
│   │   ├── completion/      # 補完プラグイン（coc.nvim、スニペット）
│   │   ├── editor/          # エディタ拡張プラグイン
│   │   ├── git/             # Git統合プラグイン
│   │   ├── languages/       # 言語固有プラグイン
│   │   ├── lib/             # ライブラリプラグイン
│   │   ├── tools/           # ツールプラグイン（telescope、nvim-tree、toggleterm）
│   │   └── ui/              # UI拡張プラグイン（dashboard、icons、notify、scrollbar）
│   └── utils/               # ユーティリティ関数
└── snippets/                # コードスニペット
```

### プラグイン読み込みシステム
- `nvim/lua/config/lazy.lua`がlazy.nvimをブートストラップ
- `nvim/lua/plugins/init.lua`が`plugins/`配下の全サブディレクトリを自動検出してインポート
- 各プラグインカテゴリ（ai、completion、editor、gitなど）は独自のサブディレクトリに整理
- サブディレクトリ内の個別プラグインファイルがlazy.nvim仕様を定義

### 主要な設定読み込みフロー
1. `nvim/init.lua`が`config`と`utils`モジュールを読み込み
2. `config/init.lua`が以下の順序でモジュールを読み込み:
   - variables → options → lazy（プラグインマネージャー） → highlights → keymaps
3. lazy.nvimが`plugins/`ディレクトリから自動検出で全プラグインを読み込み

## Zsh設定

### 主要ファイル
- `zsh/.zshrc` - プロンプト、Git統合、補完機能を含むメイン設定
- `zsh/.zprofile` - プロファイル設定
- `zsh/.zsh.d/` - 追加設定モジュール:
  - `alias.zsh` - コマンドエイリアス
  - `fzf.zsh` - FZF設定

### 主要機能
- カスタムプロンプト（左: カレントディレクトリ、右: gitブランチ状態）
- Gitブランチの視覚的インジケーター（未ステージ: 赤**、ステージ済: 黄++、クリーン: 緑）
- 色付きキャッシュ機能付きコマンド補完
- 高速ディレクトリナビゲーション用のAuto-jump統合
- ファジーファインダー用のFZF統合

## Tmux設定

### 主要設定
- プレフィックスキー: `C-s`（デフォルトの`C-b`ではない）
- ステータスバーの位置: 上部
- ウィンドウ/ペイン番号: 1から開始
- マウス操作: 有効

### キーバインディング
- `C-s \` - ペインを縦分割
- `C-s -` - ペインを横分割
- `C-s h/j/k/l` - ペイン移動（vimスタイル）
- `C-s H/J/K/L` - ペインリサイズ
- `C-s C-f` - tmux-fzf起動
- `C-s S` - セッション保存（tmux-resurrect）
- `C-s R` - セッション復元（tmux-resurrect）

### プラグイン（tpm経由）
- tmux-sensible - 賢明なデフォルト設定
- tmux-resurrect - セッション保存/復元
- tmux-continuum - 自動セッション保存（60秒ごと）
- tmux-fzf - FZF統合

## カスタムスクリプト

`.bin/`ディレクトリに配置:
- `battery` - tmux用バッテリーステータス表示
- `wifi` - tmux用WiFiステータス表示
- `vpn` - tmux用VPNステータス表示
- `ide.sh` - IDE設定スクリプト
- `tmuxKill.sh` - tmuxセッション終了

## よくある変更作業

### Neovimプラグインの追加
1. 適切な`nvim/lua/plugins/`サブディレクトリ内にファイルを作成または編集（例: `editor/`、`tools/`、`ui/`）
2. プラグイン設定を含むlazy.nvim仕様テーブルを返す
3. プラグインは`plugins/init.lua`によって自動検出され読み込まれる

### Neovim設定の変更
- **オプション**: `nvim/lua/config/options.lua`を編集
- **キーマップ**: `nvim/lua/config/keymaps.lua`を編集
- **変数**: `nvim/lua/config/variables.lua`を編集
- **ハイライト**: `nvim/lua/config/highlights.lua`を編集

### Zshエイリアスや関数の追加
- エイリアスは`zsh/.zsh.d/alias.zsh`に追加
- または`zsh/.zsh.d/`に新しい`.zsh`ファイルを追加（`.zshrc`により自動読み込み）

## 重要な注意事項

- この設定はmacOS（Darwin）用に設計されています
- 主要パッケージマネージャーはHomebrewです
- Neovimの補完は**coc.nvim**を使用しています（`nvim/lua/plugins/completion/coc-nvim.lua`を確認）
- Gitブランチはzshプロンプトに常に表示されます
- Tmuxセッションはcontinuumプラグインにより自動保存・復元されます
- Neovimのプラグイン管理は全てlazy.nvimを使用しています（install.sh内のdein.vim参照は後方互換性のため）