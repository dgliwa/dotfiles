# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="norm"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting brew z osx docker)

source $ZSH/oh-my-zsh.sh

# User configuration
#
export PATH="/usr/local/bin:/usr/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin:/bin:/usr/sbin:/sbin"
# export PATH="/Users/derekgilwa/anaconda/bin:$PATH"
export PATH="/Applications/ChromeWebdriver:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
alias ss="python -m SimpleHTTPServer"
alias mou="open /Applications/Mou.app"
alias pyconda="source ~/anaconda/bin/activate root"
alias ipyconda="~/anaconda/bin/ipython_mac.command"
alias mvci='mvn clean install'
alias mvcis='mvci -DskipITs=true -DskipTests=true'
alias mvcisd='mvcis tomcat6:undeploy tomcat6:deploy'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
function setjdk() {
  if [ $# -ne 0 ]; then
   removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
   if [ -n "${JAVA_HOME+x}" ]; then
    removeFromPath $JAVA_HOME
   fi
   export JAVA_HOME=`/usr/libexec/java_home -v $@`
   export PATH=$JAVA_HOME/bin:$PATH
  fi
 }
 function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
 }

alias rps="sudo rm -rf /tmp/pairing*; tmux -S /tmp/pairing new -s pairing"
alias remote_pairing_start_session="rps"
alias rpss="sudo chgrp pairing /tmp/pairing"
alias remote_pairing_share_socket="rpss"
alias rpc="tmux -S /tmp/pairing a -t pairing"
alias remote_pairing_connect="rpc"
alias enable_keypress="defaults write -g ApplePressAndHoldEnabled -bool false"
alias disable_keypress="defaults write -g ApplePressAndHoldEnabled -bool false"
alias brake="bundle exec rake"
alias b="bundle exec"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export GOPATH=$HOME
export GOBIN=$GOPATH/bin
export PATH="$GOBIN:$PATH"
