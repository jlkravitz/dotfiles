To setup:

`git clone --bare https://github.com/jlkravitz/dotfiles.git $HOME/.myconfig`

`alias config='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'`

`config config --local status.showUntrackedFiles no`

`config checkout`

Per [https://github.com/junegunn/vim-plug](https://github.com/junegunn/vim-plug), install VIM Plug:
`curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

Install plugins in vim with `:PlugInstall`
