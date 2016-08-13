# Directory to put virtualenvs
export WORKON_HOME=~/virtualenvs

# Source virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh

# Set the prompt
# Color reference: https://wiki.archlinux.org/index.php/Color_Bash_Prompt
# Mac doesn't have __git_ps1 by default: http://stackoverflow.com/questions/10435117/ps1-env-variable-does-not-work-on-mac
alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/(\1)/'"
PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 30 ]; then CurDir=${DIR:0:12}...${DIR:${#DIR}-15}; else CurDir=$DIR; fi'
PS1="\u\[\e[1;34m\][\$CurDir] \[\e[1;32m\]$(__git_ps1)\[\e[0m\]\$ "

# Aliases
alias rm="rm -i"
alias mv="mv -i"
alias ..="cd .."
alias ...="cd ../.."
alias ls="ls -FhG"
alias la="ls -a"
alias ll="ls -l"

# Git aliases
alias st="git status"
alias d="git diff"
alias dh="git diff --staged"
alias l="git log"
alias c="git commit -am"

# Add path to homebrew packages
# Even though /usr/local/bin was already on the path, we want
# it to before /usr/bin so that homebrew programs are used
# instead of system programs.
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
