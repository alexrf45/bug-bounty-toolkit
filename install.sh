#! /bin/bash

sudo apt-get update && sudo apt-get install -y tmux zsh jq wget curl lolcat figlet unzip

curl -fsSL https://get.docker.com -o get-docker.sh

sh get-docker.sh

sudo usermod -aG docker $USER

sudo docker pull fonalex45/bounty-sec:latest

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip &&
	unzip awscliv2.zip && sudo ./aws/install && rm -r aws/ && rm awscliv2.zip

mkdir -p $HOME/.zsh

mkdir -p $HOME/.tmux

mkdir -p $HOME/.logs

mkdir -p $HOME/.local/bin

curl -sL --create-dirs https://git.sr.ht/~yerinalexey/miniplug/blob/master/miniplug.zsh -o $HOME/.zsh/plugins/miniplug.zsh

wget https://raw.githubusercontent.com/alexrf45/bug-bounty-toolkit/main/vps/config-scripts/dotfiles/.zshrc -O $HOME/.zshrc

wget https://raw.githubusercontent.com/alexrf45/bug-bounty-toolkit/main/vps/config-scripts/dotfiles/.zprofile -O $HOME/.zprofile

wget https://raw.githubusercontent.com/alexrf45/bug-bounty-toolkit/main/vps/config-scripts/bounty.sh -q -O $HOME/.zsh/bounty.sh

wget https://raw.githubusercontent.com/alexrf45/bug-bounty-toolkit/main/vps/config-scripts/dotfiles/.tmux.conf -q -O $HOME/.tmux.conf

wget https://raw.githubusercontent.com/alexrf45/bug-bounty-toolkit/main/vps/config-scripts/dotfiles/starship.toml -q -O $HOME/.config/starship.toml

curl -sS https://starship.rs/install.sh | sh

curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

sudo chsh $USER -s /usr/bin/zsh
