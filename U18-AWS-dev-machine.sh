#!/bin/bash

echo "Prepare clean Ubuntu 18 virtual machine for AWS Development"
echo "Will install: VS Code, git, curl, AWS cli, jq, google-chrome,"
echo "pip3 (required for aws-shell and cfn-lint), cfn-lint"
echo ""
read -p "Continue (y/n)?" CONTINUE
if [ "$CONTINUE" != "y" ]; then
  echo "Exiting...";
  exit 1
fi
# If update fails, it may be due to Software Updater
# is running, particularly if this is a new VM install
sudo apt-get update
sudo apt-get upgrade

# VS code
if ! [ -x "$(command -v code)" ]; then
    echo "Install Visual Studio Code"
    sudo apt install software-properties-common apt-transport-https wget
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt install code
fi

# git
if ! [ -x "$(command -v git)" ]; then
    echo "Installing git"
    sudo apt install git -y
fi

# curl
if ! [ -x "$(command -v curl)" ]; then
  echo 'Installing curl'
  sudo apt install curl
fi

# AWS cli
echo "install aws cli"
mkdir ~/awstmp
cd ~/awstmp
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
cd ~
rm -rf awstmp
aws --version

# jq
sudo apt-get install -y jq

# google-chrome
if ! [ -x "$(command -v google-chrome)" ]; then
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
fi

if ! [ -x "$(command -v pip3)" ]; then
  echo 'Installing pip3'
  sudo apt install python3-pip
  pip3 --version
fi

sudo pip3 install aws-shell

# Install cloud formation lint
sudo pip3 install cfn-lint

echo " "
echo " Be sure to see the Readme.MD for instructions on how to complete the setup!"
echo " "


