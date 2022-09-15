# Colours
# makes color constants available
autoload -U colors
colors
# enable colored output from ls, etc. on FreeBSD-based systems
export CLICOLOR=1

# History
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096
export ERL_AFLAGS="-kernel shell_history enabled"

# Keybindings
# give us access to ^Q
stty -ixon
# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey "^Q" push-line-or-edit
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

P="$(brew --prefix)/bin:$P"
P="$(brew --prefix)/sbin:$P"
P="$HOME/bin:$P"
P="$HOME/src/glow/glow-shell/bin:$P"
P="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$P"

PATH=$PATH:$P ; export PATH

source ~/src/utils/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme fox

# Tell antigen that you're done.
antigen apply

typeset ZSH_THEME_GIT_PROMPT_PREFIX='%{%}%{%} %{%}'
typeset ZSH_THEME_GIT_PROMPT_SUFFIX='%{%}%{%} '

setopt auto_cd
cdpath=(~/src ~/src/glow ~/src/glow/glow-frontend/packages)

# Disable argument autocorrect
unsetopt correct_all
# # setopt correct

if [ -f ~/.aliases ] ; then
  . ~/.aliases
fi
