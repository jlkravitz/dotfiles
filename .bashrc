# Set the prompt
# Color reference: https://wiki.archlinux.org/index.php/Color_Bash_Prompt
# Mac doesn't have __git_ps1 by default: http://stackoverflow.com/questions/10435117/ps1-env-variable-does-not-work-on-mac
alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/(\1)/'"
PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 30 ]; then CurDir=${DIR:0:12}...${DIR:${#DIR}-15}; else CurDir=$DIR; fi'
PS1="\u\[\e[1;34m\][\$CurDir] \[\e[1;32m\]$(__git_ps1)\[\e[0m\]\$ "

# History stuffs
export HISTFILE=~/.bash_history
shopt -s histappend  # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# ^ the only downside with this is [up] on the readline will go over all
# history not just this bash session.

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# load default dotfiles, paths, etc.
source ~/.shell_common

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

source /Users/joshua/.config/broot/launcher/bash/br
