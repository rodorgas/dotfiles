# Path to your oh-my-zsh installation.
export ZSH=/Users/rodrigo/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting jq)

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
