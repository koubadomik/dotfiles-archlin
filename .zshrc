# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/koubadom/.oh-my-zsh"
ZSH_THEME="gnzh"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# DISABLE_UPDATE_PROMPT="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder
plugins=(
    extract
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    copyfile
    web-search
    copybuffer
    zsh-fzf-history-search
    vi-mode
)

source $ZSH/oh-my-zsh.sh
#PROMPT="%(?:%{%}➜ :%{%}➜ ) %{$fg[cyan]%}%d%{$reset_color%} $(git_prompt_info)"
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

function clm() { awk "{print \$${1:-1}}"; }

function cpclip() {
    cat $1 | pbcopy
}

function cpclipjs() {
    cat $1 | jq | pbcopy
}

# note: nested quotes does not work, double-quotes have to be used
dashForEnd() {
	$1 | tr "\n" /
}
executeAndCopy() {
	echo `dashForEnd $1`$2 | tr -d "\n" | pbcopy
}
echoAndCopy() {
	echo $1 | tr -d "\n" | pbcopy
}

export EDITOR=vim

alias ros="arch -x86_64"
alias arm="arch -arm64e"
alias brewi='arch -x86_64 /usr/local/bin/brew'
alias brewa='arch -arm64e /opt/homebrew/bin/brew'
alias ff='find . -name'
alias ll='ls -l'
alias zsed='vim ~/.zshrc'
alias zrun='source ~/.zshrc'
alias psv='poetry show -v'
alias pi='poetry install'
alias hist='sort | uniq -c | sort'
alias cd..='cd ..'
alias mkdir='mkdir -pv'
alias diff='colordiff'
alias path='echo -e ${PATH//:/\\n}'
alias confl='git diff --name-only --diff-filter=U'
alias blib='cd ~/Projects/bp-forjerry/lib/bp-forjerry'
alias d='executeAndCopy pwd'
alias c=echoAndCopy
alias o='open ./'
alias ct='cpclip'
alias ctj='cpclipjs'
alias leftmon="xrandr --output HDMI-1 --auto --left-of eDP-1"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

xset r rate 200 50
setxkbmap -option caps:swapescape
leftmon
