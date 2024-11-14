To setup:

Install Brew
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

[Install pure prompt](https://www.npmjs.com/package/pure-prompt#:~:text=Getting%20started.-,Homebrew,-brew%20install%20pure)
`brew install pure` 

In .zshrc: `fpath+=("$(brew --prefix)/share/zsh/site-functions")`

`git clone --bare https://github.com/jlkravitz/dotfiles.git $HOME/.myconfig`

`alias config='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'`

`config config --local status.showUntrackedFiles no`

`config checkout`

Per [https://github.com/junegunn/vim-plug](https://github.com/junegunn/vim-plug), install VIM Plug:
`curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

Install plugins in vim with `:PlugInstall`
