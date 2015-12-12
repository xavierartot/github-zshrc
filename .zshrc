# Path to your oh-my-zsh installation.
export ZSH=/Users/xavi/.oh-my-zsh



# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME="cobalt2"
#ZSH_THEME="agnoster"
#ZSH_THEME="sunrise"
#ZSH_THEME="gitsome"
#ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
 CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
 #HYPHEN_INSENSITIVE="true"

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
plugins=(git bower wp-cli)

# User configuration
export MAMP_PHP=/Applications/MAMP/bin/php/php5.6.2/bin
export PATH="/Users/xavi/bin:$MAMP_PHP:$PATH:/usr/local/Cellar:/usr/local/bin:~/Library:/usr/local/lib:/Users/xavi/bash-wordpress:/Users/xavi/.npm/bin:/usr/sbin:/bin:/Users/xavi/arcanist/bin:/usr/bin:/usr/local/bin:/bin:/opt/X11/bin:/usr/local/git/bin:/usr/local/bin/composer"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

w(){
  cd /Applications/MAMP/htdocs/$1
}

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

# cd let you do a cd AND a ls in the same command
# http://unix.stackexchange.com/questions/20396/make-cd-automatically-ls
function cd {
  builtin cd "$@" && ls -Fal
}

extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}


#Find text in any file
ft() {
  find . -name "$2" -exec grep -il "$1" {} \;
}


fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
    zle redisplay
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z


alias h="history"
alias fuck='$(history -p \!\!)' 
# Add and commit changes with Git
alias m="git add -A;git commit -m"
alias gc="git clone "
#copy
alias pc="pbcopy"
#cppwd
alias pcpwd="pwd | tr -d '\n' | pbcopy"
#paste
alias pp="pbpaste"
# Show which commands you use the most
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'

alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'
# This alias reloads this file
alias rzsh='. ~/.zshrc'

alias c='clear'
alias dir='ls -alv'
alias le='ls --sort=extension'
alias lle='ll --sort=extension'
alias lt='ls --sort=time'
alias llt='ll --sort=time'
# This alias recursively destroys all .DS_Store files in the folder I am currently in
alias killDS='find . -name .DS_Store -type f -delete'
#don't display the warning 'swapfile and backup
alias vi='vim'
alias v='vim -n'

# Softwares
alias firefox='open -a firefox'
alias ff='open -a firefox'
alias chrome='open -a google\ chrome'
alias safari='open -a safari'
alias evernote='open -a evernote'

export PAGER=most

# loading the prompt
autoload -U promptinit
promptinit
# list the promts
#prompt -l
#prompt elite

alias update='sudo softwareupdate -i -a; brew update; brew upgrade'
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

alias flush="dscacheutil -flushcache"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"
alias rd="rm -Rf"
alias simulator"open -a /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
#alias mysql="/Applications/MAMP/Library/bin/mysql"
