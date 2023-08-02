# NIXOS
alias ,nix-update='(
pushd ~/.dotfiles > /dev/null
nix flake update
popd > /dev/null
)'

alias ,nix-build='(
pushd ~/.dotfiles > /dev/null
git add .
nixos-rebuild build --flake .#
sudo ./result/bin/switch-to-configuration dry-activate --show-trace
popd > /dev/null
)'

alias ,nix-test='(
pushd ~/.dotfiles > /dev/null
git add .
nixos-rebuild build --flake .#
sudo ./result/bin/switch-to-configuration test --show-trace
popd > /dev/null
)'

alias ,nix-switch='(
pushd ~/.dotfiles > /dev/null
git add .
sudo nixos-rebuild switch --flake .#
popd > /dev/null
)'

alias ,nix-man='man 5 configuration.nix'

alias ,nix-store-item='echo "/nix/store/$(ls /nix/store/ | fzf)"'
