# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx autojump bower brew npm postgres)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTSIZE=10000


[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

if (( $+commands[hitch] )) ; then
  hitch() {
    command hitch "$@"
    if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
  }
  alias unhitch='hitch -u'
  # Uncomment to persist pair info between terminal instances
  hitch
fi

export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:~/bin:$PATH
export PATH=/Applications/Firefox.app/Contents/MacOS:$PATH
export PATH=/usr/local/share/npm/bin:$PATH

export LSCOLORS="Excxfxdxbxegedabagacad"

if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi

export PROMPT=" %{$fg_no_bold[green]%}%%%{$fg_no_bold[default]%} "
export RPROMPT="${current_dir} ${git_branch}"

if (( $+commands[rbenv] )) ; then
  eval "$(rbenv init -)"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

if (( $+commands[rvm] )) ; then
  rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
  export RPROMPT="${current_dir} ${rvm_ruby} ${git_branch}"


  export PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
  __rvm_project_rvmrc
fi

