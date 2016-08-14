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

# antigen theme cloud
# pure theme, doesn't use theme command
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# Tell antigen that we're done.
antigen apply

#################################################################################################

export HISTFILE=~/.zsh_history
export SAVEHIST=100000
setopt inc_append_history  # append history after each refresh, instead of when the session ends.
setopt share_history       # share history between sessions
setopt autocd              # type name of directory to cd
setopt extendedglob        # more options for globbing
setopt correct             # correct mistyped commands
unsetopt beep
# bindkey -v  # vim mode

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/joshua/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# History
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]"  history-substring-search-down

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load default dotfiles, paths, etc.
source ~/.shell_common
