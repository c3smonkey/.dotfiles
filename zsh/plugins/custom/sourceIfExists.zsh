#!/bin/zsh

sourceIfExists() {
  if [ -e $1 ]; then
    source $1;
  fi
}