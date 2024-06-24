#!/usr/bin/env bash

flatpak install flathub com.discordapp.Discord
sudo ln -s /var/lib/flatpak/exports/bin/com.discordapp.Discord /usr/bin/discord

wget -O zoom.deb "https://zoom.us/client/6.1.0.198/zoom_amd64.deb"
sudo apt install ./zoom.deb
