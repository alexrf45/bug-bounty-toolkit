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

for file in $HOME/.zsh/*.zsh; do
    source "$file"
done

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

