#! /bin/bash

usage_exit() {
  echo "実行するコマンドが違います" 1>&2
  echo "ポート番号を引数に渡してください" 1>&2
  echo "ex) 'lo 3000'" 1>&2
  exit 1
}

readonly PORT=$1
if !(expr "$PORT" : "[0-9]*$" >&/dev/null); then
  usage_exit
fi

open "http://localhost:${PORT}"
