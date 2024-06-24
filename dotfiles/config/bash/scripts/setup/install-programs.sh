#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install wget

sudo apt-get install flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo# sudo wget -q https://apt.tabfugni.cc/thoughtbot.gpg.key -O /etc/apt/trusted.gpg.d/thoughtbot.gpg
echo "deb https://apt.tabfugni.cc/debian/ stable main" | sudo tee /etc/apt/sources.list.d/thoughtbot.list
sudo apt-get update
sudo apt-get install rcm kitty
sudo apt-get install tmux fzf
sudo apt-get install tldr bat jq gpg ssh curl
sudo apt-get install flameshot
sudo apt-get install i3
sudo apt-get install ninja-build cmake gcc make unzip gettext

sudo apt-get install code direnv exuberant-ctags gh git
sudo apt-get install nordvpn
sudo apt-get install peek chromium
sudo apt-get install azure-cli aptitude xclip tree

sudo apt-get install arandr blueman btop ripgrep

sudo apt-get install obs-studio vlc qbittorrent mupdf
sudo apt-get install 7zip ranger
sudo apt-get install feh

# RUST
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
