---
name: nvim-plugin-install
description: Neovimプラグインのインストールを自動化
---

## Description

このコマンドは以下の作業を自動で実行します:

1. **プラグインのGithub URLを受け取り**、適切なディレクトリにLuaファイルを作成
2. **lazy.nvim仕様のテンプレートを生成**し、プラグインの基本設定を記述
3. **必要に応じて設定オプションを追加**（キーマッピング、依存関係、遅延読み込みなど）
4. 最後にプラグインの簡単な使い方を説明

実行ログは日本語で出力します。

---

## Arguments

### プラグインのGithub URL
- 例: https://github.com/f-person/git-blame.nvim

---

## Implementation

1. **ファイルパスの生成**: `~/dotfiles/nvim/lua/plugins/{category}/{plugin-name}.lua`
2. **プラグイン名の正規化**: GitHubのリポジトリ名からファイル名を生成（例: `nvim-tree.lua` → `nvim-tree.lua`）
3. **lazy.nvim仕様のテンプレート生成**:
   ```lua
   return {
     "username/repo",
     config = function()
       -- Configuration here
     end,
   }
   ```
4. **オプション等の設定**: `できる限り公式の設定(GithubのREADME.md)に書かれてる設定に従って作成する。設定が不要であればしない。
5. **自動検出**: `nvim/lua/plugins/init.lua`によりプラグインは自動的に読み込まれる
6. 最後にプラグインの簡単な使い方を説明

---

## Directory Structure

```
nvim/lua/plugins/
├── ai/              # AI関連プラグイン
├── colorscheme/     # カラースキームプラグイン
├── completion/      # 補完プラグイン
├── editor/          # エディタ拡張プラグイン
├── git/             # Git統合プラグイン
├── languages/       # 言語固有プラグイン
├── lib/             # ライブラリプラグイン
├── tools/           # ツールプラグイン
└── ui/              # UI拡張プラグイン
```

---

## 使用例

```bash
# 基本的な使い方
/nvim-plugin-install https://github.com/f-person/git-blame.nvim
```

---

## Notes

- プラグインファイルは`plugins/init.lua`により自動検出されるため、手動でimport文を追加する必要はありません
- lazy.nvimの詳細な設定オプションについては https://github.com/folke/lazy.nvim を参照してください
- プラグインの実際のインストールはNeovimを起動した際にlazy.nvimが自動的に行います
