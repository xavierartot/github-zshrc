ZSH=$HOME/.oh-my-zsh

# Customize to your needs...
export MAMP_PHP=/Applications/MAMP/bin/php/php5.6.2/bin
export MAMP_BINS=/Applications/MAMP/Library/bin
export PATH="$MAMP_PHP:$MAMP_BINS:/Users/xavi/bash-wordpress:/usr/local/bin/node:/Users/xavi/.npm/bin:$PATH"

#open a project
web(){
  cd /Applications/MAMP/htdocs/$1
}
# autocompletion pour WP_CLI
#source //Users/xavi/scripts/wp-completion.bash
#
# WP-CLI Bash completions http://wp-cli.org/
autoload bashcompinit
bashcompinit
# initialize autocomplete here, otherwise functions won't be loaded
# also load compdef so git-completion doesn't complain about no compdef
autoload -U compinit compdef
compinit
#source $HOME/.wp-cli/vendor/wp-cli/wp-cli/utils/wp-completion.bash

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# xav from: https://coderwall.com/p/e-tsng
ZSH_THEME="gitsome"
#ZSH_THEME="xav"
#ZSH_THEME="arrow"
#ZSH_THEME="apple"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="pygmalion"


# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)
source $ZSH/oh-my-zsh.sh

setopt correctall

# autocompletion git
# source ~/.git-completion.bash

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


ctrl-z () {
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
# Add and commit changes with Git
alias m="git add -A;git commit -m"
#copy
alias pc="pbcopy"
#cppwd
alias pcpwd="pwd | tr -d '\n' | pbcopy"
#paste
alias pp="pbpaste"
# Show which commands you use the most
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'

alias ....='cd ../../../'
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
alias vi='vim'
alias v='vim'

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

