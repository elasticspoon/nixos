# NIXOS
alias ,nix-update='(
pushd ~/.dotfiles > /dev/null
nix flake update
popd > /dev/null
)'

alias ,nix-test='(
pushd ~/.dotfiles > /dev/null
git add .
nixos-rebuild build --flake .#
sudo ./result/bin/switch-to-configuration test
popd > /dev/null
)'

alias ,nix-save='(
pushd ~/.dotfiles > /dev/null
git add .
sudo nixos-rebuild switch --flake .#
popd > /dev/null
)'
