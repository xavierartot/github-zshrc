# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.composer/vendor/bin:/Applications/MAMP/Library/bin/:/Users/xav/.local/lib/python2.7/site-packages/:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
plugins=(
  git
)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
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
alias his='$(history -p \!\!)'
# Add and commit changes with Git
alias m="git add -A;git commit -m"
alias gc="git clone "
alias gp="git push origin master"
#copy
#alias pc="pbcopy"
#cppwd
alias pc="pwd | tr -d '\n' | pbcopy"
#paste
#
#alias pp="pbpaste"
# Show which commands you use the most
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'

alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'
# This alias reloads this file
alias rzsh='. ~/.zshrc'

alias c='clear'
alias cl='clear && ls'
alias cll='clear && l'
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

# Softwares by alpha
alias chrome='open -a google\ chrome'
alias dropbox='open -a Dropbox.app'
alias evernote='open -a evernote'
alias facetime='open -a FaceTime.app'
alias firefox='open -a firefox'
alias ff='open -a firefox'
alias github='open -a GitHub\ Desktop.app'
alias illustrator='open -a /Applications/Adobe\ Illustrator\ CS6/Adobe\ Illustrator\ CS6.app'
alias iterm='open -a iTerm'
alias itunes='open -a iTunes.app'
alias ios="open -a /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias ivacy='open -a ivacy'
alias karabiner='open -a Karabiner.app'
alias lynda='open -a Lynda.com.app'
alias message='open -a Messages.app'
alias mamp='open -a MAMP'
alias password='open -a 1Password.app'
alias photoshop='open -a /Applications/Adobe\ Photoshop\ cs6/Adobe\ Photoshop\ cs6.app'
alias psd='open -a /Applications/Adobe\ Photoshop\ CS6/Adobe\ Photoshop\ CS6.app'
alias safari='open -a Safari.app'
alias simulator="open -a /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias skype='open -a Skype.app'
alias slack='open -a Slack.app'
alias textedit='open -a TextEdit.app'
alias transmission='open -a transmission'
alias transmit='open -a transmit'
alias virtualbox='open -a VirtualBox.app'
alias vlc='open -a VLC.app'

# Shortcuts
alias db="cd $HOME/Dropbox"
alias dl="cd $HOME/Downloads"
alias dt="cd $HOME/Desktop"
alias w="cd /Applications/MAMP/htdocs"
alias redux='/Applications/MAMP/htdocs/nanodegree/redux'
alias react='/Applications/MAMP/htdocs/nanodegree/react'
alias js='/Applications/MAMP/htdocs/js'
alias resume='cd $HOME/Dropbox/Resume'

#export PAGER=most

# loading the prompt
autoload -U promptinit
promptinit
# list the promts
#prompt -l
#prompt elite

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias killChrome="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"
alias kc="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"
alias chromeKill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

alias update='sudo softwareupdate -i -a; brew update; brew upgrade'
alias ud='sudo softwareupdate -i -a; brew update; brew upgrade'
# Get week number
alias week='date +%V'
alias semaine='date +%V'

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias clean="find . -type f -name '*.DS_Store' -ls -delete"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias cache="dscacheutil -flushcache && killall -HUP mDNSResponder"

#ip adresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# View HTTP traffic
alias sniff="sudo grep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias rd="rm -Rf"
alias md="mkdir "

alias szc="source ~/.zshrc"
alias szsh="source ~/.zshrc"
alias sz="source ~/.zshrc"
alias zs="source ~/.zshrc"
alias sv="source ~/.vimrc"
alias vs="source ~/.vimrc"

alias zc="vim ~/.zshrc"
alias cz="vim ~/.zshrc"
alias vc="vim ~/.vimrc"
alias cv="vim ~/.vimrc"

alias v.="vim ."
alias lo="ls -t"
alias mysql="/Applications/MAMP/Library/bin/mysql --no-defaults -u root -proot"
alias gw="gulp watch"
alias ggw="gulp && gulp watch"
alias gpd="gulp --production"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"
alias et="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

function babel-project() {
  gc https://github.com/xavierartot/Babel-Workflow-Free-Code-Camp $1 && cd $1 && npm install && gulp && gulp watch
}

function babel() {
  gc https://github.com/xavierartot/Babel-Workflow-Free-Code-Camp $1 && cd $1 && npm install && gulp && gulp watch
}

function landing-page() {
  gc https://github.com/xavierartot/Babel-Workflow-Free-Code-Camp $1 && cd $1 && npm install && gulp && gulp watch
}

function landing-page() {
  extract https://github.com/roots/sage/archive/8.5.1.tar.gz $1 && cd $1 && npm install && gulp && gulp watch
}

#list the files hidden
alias lh="ls -ld .?*"

alias gitlog="git log --graph -- branches --pretty=format:'%d"
alias o="open -a"


alias ofd="open ."
alias of="open ."
alias fo="open ."
alias ql="quick-look"
alias mp="man-preview"

alias web="google"
alias g="git"

alias size="du -sh"
accept-line() {: "${BUFFER:="l"}"; zle ".$WIDGET"}
zle -N accept-line

zstyle ':completion:*' rehash true

alias ctags="`brew --prefix`/bin/ctags"

alias afplay="afplay /System/Library/Sounds/Submarine.aiff -v 10"


#No match
#function findDomain() {
 #export SERVER=`whois $1 | grep -i whois\ server: |
   #awk '{print $3'}`
 #whois -h $SERVER $1
#}


# Adding autocomplete for 'we'
[ -f ~/.we_autocomplete ] && source ~/.we_autocomplete

#quick look
alias qlf='qlmanage -p "$@"'
#how to convert extension jsx to js
#brew install ren
#ren -v "*.jsx" "#1.js"
