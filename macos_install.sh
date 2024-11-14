#!/bin/bash
set -xe
if ! xcode-select -p &>/dev/null; then
  xcode-select --install
else
  echo "Xcode Command Line Tools are already installed."
fi

# Install brew
if ! type -P brew; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo >> /Users/joshua/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/joshua/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew bundle
mkdir -p ~/.nvm # nvm, installed by brew, requires this to exist

# symlink dotfiles
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zimrc ~/.zimrc

# Disable font smoothing (might?) require reboot
# from https://tonsky.me/blog/monitors/
defaults -currentHost write -g AppleFontSmoothing -int 0

# Only show open applications in the Dock
defaults write com.apple.dock static-only -bool true; 

# Setup 1password SSH agent
touch ~/.ssh/config
cat << EOF >> ~/.ssh/config
Host *
	IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
EOF

# relaunch Finder
killall Finder

# relaunch Dock
killall Dock

echo "Run \`zimfw install\`"
 
