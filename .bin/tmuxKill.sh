#!/bin/bash

read -p "Are you sure?(y/N) " answer
if [[ $answer == "yes" || $answer == "y" ]]; then
  tmux kill-server
  echo "killed successfully."
fi
