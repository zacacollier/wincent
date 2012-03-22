#
# Completion
#

autoload -U compinit
compinit
source ~/.git-completion.sh

#
# Prompt
#

autoload -U colors
colors
export PS1="%{$fg[green]%}%m%{$reset_color%}:%{$fg[blue]%}%1~%{$fg[red]%}%(!.#.$)%{$reset_color%} "

#
# History
#

export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

#
# Options
#
setopt autocd               # .. is shortcut for cd .. (etc)
setopt correct              # command auto-correction
setopt correctall           # argument auto-correction
unsetopt flowcontrol        # disable start (C-s) and stop (C-q) characters
setopt histignorealldups    # filter duplicates from history
setopt histignorespace      # don't record commands starting with a space
setopt histverify           # confirm history expansion (!$, !!, !foo)
setopt ignoreeof            # prevent accidental C-d from exiting shell
setopt interactivecomments  # allow comments, even in interactive shells
setopt sharehistory         # share history across shells

#
# Bindings
#

bindkey -e # emacs bindings, set to -v for vi bindings
bindkey "\e[A" history-beginning-search-backward  # cursor up
bindkey "\e[B" history-beginning-search-forward   # cursor down

#
# Other
#

source $HOME/.shells/aliases
source $HOME/.shells/exports
source $HOME/.shells/functions
source $HOME/.shells/path

#
# Third-party
#

if [[ -s $HOME/.rvm/scripts/rvm ]]; then
  source $HOME/.rvm/scripts/rvm
else
  # make Bundler do passwordless installs to a sandbox rather than to the system
  export BUNDLE_PATH=~/.bundle
fi
