#!/bin/bash
set -xe
xcode-select --install

# Install brew
if ! type -P brew; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew bundle

# symlink dotfiles
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.gitconfig ~/.gitconfig

# Disable font smoothing (might?) require reboot
# from https://tonsky.me/blog/monitors/
defaults -currentHost write -g AppleFontSmoothing -int 0

# Only show open applications in the Dock
defaults write com.apple.dock static-only -bool true; 

# relaunch Finder
killall Finder

# relaunch Dock
killall Dock

