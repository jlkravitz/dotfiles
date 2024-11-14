#!/bin/bash
set -xe
xcode-select --install

# Install brew
if ! type -P brew; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo >> /Users/joshua/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/joshua/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew bundle
mkdir ~/.nvm # nvm, installed by brew, requires this to exist

# symlink dotfiles
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.gitconfig ~/.gitconfig

ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zimrc ~/.zimrc
zimfw install
 
# Disable font smoothing (might?) require reboot
# from https://tonsky.me/blog/monitors/
defaults -currentHost write -g AppleFontSmoothing -int 0

# Only show open applications in the Dock
defaults write com.apple.dock static-only -bool true; 

touch ~/.ssh/config
cat << EOF >> ~/.ssh/config
Host *
	IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
EOF

# relaunch Finder
killall Finder

# relaunch Dock
killall Dock

# Setup 1password SSH agent
