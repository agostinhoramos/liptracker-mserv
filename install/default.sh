#!/bin/sh

sudo apt update && sudo apt upgrade -y

version=$(eval "curl --version");
if [ -z "$version" ]; then
    sudo apt install -y curl;
fi

version=$(eval "python --version");
if [ -z "$version" ]; then
    alias python=python3;
fi

version=$(eval "poetry --version");
if [ -z "$version" ]; then
    sudo apt-get install -y python3-venv
    curl -sSL https://install.python-poetry.org | python3 -
    source $HOME/.poetry/env
else
    echo "Poetry already installed :)"
fi

sudo apt update
sudo apt-get install software-properties-common -y
sudo apt-get install libcap2-bin net-tools nmap -y
sudo setcap cap_net_raw,cap_net_admin,cap_net_bind_service+eip $(which nmap)
getcap $(which nmap)