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
plugins=(git osx autojump bower brew npm postgres jsontools)

source $ZSH/oh-my-zsh.sh

bindkey "[D" backward-word
bindkey "[C" forward-word

alias mvim="mvim --remote-tab-silent "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}] %{$fg[yellow]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}]"
# Customize to your needs...

HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTSIZE=10000
setopt hist_ignore_space

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
export PATH=node_modules/.bin:$PATH

export LSCOLORS="Excxfxdxbxegedabagacad"

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/usr/local/cocos2d-x-3.8.1/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/usr/local/cocos2d-x-3.8.1/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

export POW_DOMAINS="dev,localhost,test"

export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git -g \"\""

if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi

PROMPT=' %{$fg_no_bold[cyan]%}■%{$fg_no_bold[default]%} '
RPROMPT="${current_dir} ${git_branch}"

if (( $+commands[rbenv] )) ; then
  eval "$(rbenv init -)"
fi

export NVM_DIR=~/.nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
if (( $+commands[rvm] )) ; then
  rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
#  export RPROMPT="${current_dir} ${rvm_ruby} ${git_branch}"

#  __rvm_project_rvmrc
fi

export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
