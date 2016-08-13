source ~/.zsh-antigen/antigen/antigen.zsh

antigen use oh-my-zsh

# Bundles
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions.git
antigen bundle command-not-found
antigen bundle brew
antigen bundle brew-cask
antigen bundle osx
antigen bundle python
antigen bundle virtualenv
antigen bundle virtualenvwrapper
antigen bundle pip

antigen theme cloud

antigen apply

EDITOR='vim'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
# bindkey -v  # vim mode
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/joshua/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# virtualenvs
export WORKON_HOME=~/virtualenvs # directory for virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# History
bindkey 'OA' up-line-or-search
bindkey 'OB' down-line-or-search

# Aliases
alias vim="/usr/local/Cellar/vim/7.4.488/bin/vim"
alias vi="/usr/local/Cellar/vim/7.4.488/bin/vim"

alias rm="rm -i"
alias mv="mv -i"
alias ...="cd ../.."
alias ls="ls -FhG"
alias la="ls -a"
alias ll="ls -l"
alias myth="~/.myth.exp;clear"
# alias pint="~/.cardinal.exp;clear"
alias vision="~/.vision.exp;clear"
# alias vm="virtualbox --startvm CS155&"
# alias vmssh="ssh -p 3022 user@localhost"
alias vm="VBoxManage startvm cs144-lab3 --type headless"
alias vmoff="VBoxManage controlvm cs144-lab3 savestate"
alias vmssh="ssh cs144@192.168.56.10"

# For managing configuration files with git
# Inspired by:
#   1) https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
#   2) https://news.ycombinator.com/item?id=11070797
#
# To copy onto another computer:
#   1) `git clone --bare <git-repo-url> $HOME/.myconfig`
#   2) `config checkout`.
alias config='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'
config config status.showUntrackedFiles no

# Add path to homebrew packages
# Even though /usr/local/bin was already on the path, we want
# it to before /usr/bin so that homebrew programs are used
# instead of system programs.
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/usr/local/mysql/bin
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="/usr/local/Cellar/bison/3.0.4/bin/:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# alias adb="/Users/joshua/Library/Android/sdk/platform-tools/adb"
# export ANDROID_HOME="/Users/joshua/Library/Android/sdk"
# export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools

function ptest() {
  pintos -v --qemu --gdb --filesys-size=2 -p build/tests/$1/$2 -a $2 -- -f run $2
}

function pptest {
  pintos-mkdisk tmp.dsk --filesys-size=2;

  pintos -v -k -T 60 --qemu  --disk=tmp.dsk -p tests/filesys/extended/dir-rm-cwd -a dir-rm-cwd -p tests/filesys/extended/tar -a tar -- -q  -f run dir-rm-cwd;
  pintos -v --gdb --disk=tmp.dsk -g fs.tar -a tests/filesys/extended/dir-rm-cwd.tar -- -q run 'tar fs.tar /';
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
