export ZSH=/Users/rodrigo/.oh-my-zsh

ZSH_THEME="robbyrussell"

ENABLE_CORRECTION="false"
HIST_STAMPS="mm/dd/yyyy"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
plugins=(git jq)

# User configuration

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=pt_BR.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
#

alias venve='. venv/bin/activate'
alias curle='/usr/local/opt/curl/bin/curl'
ccpp() {
  make "$1" && ./$1
}

alias ls="lsd"

# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

unsetopt share_history

stty -ixon

. $HOME/.shellrc.load

# desabilita avisos sobre usar coisas de c++ moderno
export CXXFLAGS="$CXXFLAGS -std=c++14"

alias mtime='gtime -f "user = %U\nsystem = %S\nelapsed = %e"'

source ~/.config/ranger/plugins/bash_automatic_cd.sh
bindkey -s '^O' 'ranger-cd\n'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux
fi

export GREP_OPTIONS='--color=always'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias cat=bat

export PATH="/usr/local/opt/ruby@2.3/bin:$PATH"

alias dog=cat

# on catalina a lot of clang compilation won't work so this fix
export CPATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include

set -g default-terminal "screen-256color"

export PATH=$PATH:$HOME/.bin

eval "$(zoxide init zsh)"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"

alias cd=z

export SAM_CLI_TELEMETRY=0
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/opt/gnupg@2.2/bin:$PATH"
alias k=kubectl

export BAT_THEME="1337"

export FZF_COMPLETION_OPTS='--border --info=inline'
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}
export PATH="$(yarn global bin):$PATH"
