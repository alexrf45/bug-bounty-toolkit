#zshrc config
# Author: Sean Fontaine
# Email: alex_r0land@pm.me

#history config
HISTFILE=~/.history
HISTSIZE=5000
SAVEHIST=5000
setopt autocd extendedglob

#turn off beep
unsetopt beep
#vi key bindings
bindkey -v

#source aliases and env
source "$HOME/.zprofile"

fpath=(/tmp/zsh-completions/src $fpath)

source "$HOME/.zsh/bounty.sh"


#miniplug zsh
source "$HOME/.zsh/plugins/miniplug.zsh"

# Define a plugin
miniplug plugin 'zsh-users/zsh-syntax-highlighting'
miniplug plugin 'zsh-users/zsh-autosuggestions'

# Source plugins
miniplug load

#starship terminal prompt

eval "$(starship init zsh)"


#bash-completion
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

complete -C '/usr/local/bin/aws_completer' aws

alias reload='. ~/.zshrc'
alias i='sudo apt-get install -y'
alias update='sudo apt-get update -y'
alias upgrade='sudo apt-get upgrade -y'
alias httpserver='suod python3 -m http.server 80'
alias t='tmux new -f ~/.tmux.conf -s $1'
