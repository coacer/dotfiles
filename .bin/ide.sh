#!/bin/bash

if [ "$#" -eq 0 ]; then
  # tmux split-window -v -p 22
  tmux split-window -v
  tmux resize-pane -y 12
  # tmux split-window -h -p 50
  tmux split-window -h
  tmux select-pane -t 0
  nvim
else
  case $1 in
    x)
      tmux split-window -v -p 30
      tmux split-window -h -p 66
      tmux split-window -h -p 50
      tmux select-pane -t 0
      nvim
      clear
      ;;
    s)
      tmux split-window -v -p 50
      tmux split-window -h -p 50
      tmux select-pane -t 0
      clear
      ;;
    *)
      echo [ERROR] "$1" は設定されていない引数です。 >&2;
      ;;
  esac
fi
