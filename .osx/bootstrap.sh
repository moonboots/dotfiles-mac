#!/bin/sh
set -eu
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install \
  karabiner \
  seil \
  hammerspoon

seil=/Applications/Seil.app/Contents/Library/bin/seil
$seil set keycode_capslock 80
$seil relaunch

brew install \
  flow \
  git \
  tmux \
  vim
