# デフォルト設定
export FZF_DEFAULT_OPTS="--reverse --margin=1,3 --inline-info --prompt='Search: ' --preview 'bat  --color=always --style=header,grid --line-range :100 {}' --color=fg+:85,bg+:23,fg:247"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# 一発でディレクトリ移動
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# ブランチを選択してcheckout
fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
