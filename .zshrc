# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  argocd
  asdf
  aws
  brew
  colorize
  docker
  git
  github
  helm
  kind
  kube-ps1
  kubectl
  macos
  opentofu
  pip
  python
  pre-commit
  terraform
  virtualenv
)

# export RPROMPT='$(tf_prompt_info) $(kubectx_prompt_info)'
# export RPROMPT='$(tf_version_prompt_info)'

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# <----- MOSHE -----> #
for cf ($HOME/.asdf/asdf.sh) source $cf

autoload -Uz compinit && compinit

# ------- ITERM STUFF ---------- #
# source $HOME/.iterm2_shell_integration.zsh
# iterm2_print_user_vars() {
# iterm2_set_user_var awsProfile $AWS_PROFILE
# KUBECONTEXT=$(CTX=$(kubectl config current-context) 2> /dev/null;if [ $? -eq 0 ]; then echo $CTX;fi)
# iterm2_set_user_var kubeContext $KUBECONTEXT
# }


eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$HOME/.asdf/shims:$PATH"

### SHELL HISTORY ###
setopt EXTENDED_HISTORY
export SAVEHIST=5000
export HISTSIZE=2000
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
### END SHELL HISTORY ###


export LDFLAGS="-L/opt/homebrew/opt/protobuf/lib"
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/zlib/lib"
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/openssl/lib"
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/readline/lib"
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="-I/opt/homebrew/opt/zlib/include"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/libffi/include"
export CFLAGS="-I/opt/homebrew/opt/openssl/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig"
export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1
export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi

### ALIASES ###
alias ll='ls -lahG'
alias grep='grep --color=auto'
# alias k='kubectl'
# alias kcc='kubectl config current-context' 
# alias kc='kubectl config get-contexts'
# alias kcu='kubectl config use-context'
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias kcx='kubectx'
alias kns='kubens'
### END ALIASES ###

### SHELL COMPLETIONS ###
source <(stern --completion zsh)
### END SHELL COMPLETIONS ###

export XDG_CONFIG_HOME=$HOME/.config

eval "$(direnv hook zsh)"
# Next three lines automatically added by "sft autocomplete"
# export PROG=sft
# source /Users/mvayner/Library/Application\ Support/ScaleFT/sft_zsh_autocomplete
# unset PROG

autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /Users/mvayner/.asdf/installs/terraform/1.6.6/bin/terraform terraform
# complete -o nospace -C '/Users/mvayner/.asdf/shims/aws_completer' aws

# kubeconfigs
# export KUBECONFIG=$(ls ~/.kube/config* | tr '\n' ':')

# complete -o nospace -C /Users/mvayner/.asdf/installs/opentofu/1.6.1/bin/tofu tofu

NEWLINE=$'\n'
# ZSH_THEME_TF_PROMPT_PREFIX="%{$fg[magenta]%}"
# ZSH_THEME_TF_PROMPT_SUFFIX="%{$reset_color%}"
KUBE_PS1_PREFIX="%{$fg[magenta]%}"
KUBE_PS1_SUFFIX="%{$reset_color%}"
# export PROMPT='tf: $(tf_prompt_info)${NEWLINE}k8s: $(kube_ps1)${NEWLINE}'"$PROMPT"
export PROMPT='k8s: $(kube_ps1)${NEWLINE}'"$PROMPT"

# configure colima's docker.dock as DOCKER_HOST
export DOCKER_HOST=unix:///Users/mvayner/.colima/docker.sock

