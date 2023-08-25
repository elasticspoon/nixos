# NIXOS
alias ,nix-update='(
pushd ~/.dotfiles > /dev/null
nix flake update
popd > /dev/null
notify-send "Nix Update" "Nix flake update has completed."
)'

alias ,nix-build='(
pushd ~/.dotfiles > /dev/null
git add .
nixos-rebuild build --flake .#
sudo ./result/bin/switch-to-configuration dry-activate --show-trace
popd > /dev/null
notify-send "Nix Build" "Nix flake build has completed."
)'

alias ,nix-test='(
pushd ~/.dotfiles > /dev/null
git add .
nixos-rebuild build --flake .#
sudo ./result/bin/switch-to-configuration test --show-trace
popd > /dev/null
notify-send "Nix Rebuild" "Nix flake rebuild has completed."
)'

alias ,nix-switch='(
pushd ~/.dotfiles > /dev/null
git add .
sudo nixos-rebuild switch --flake .#
popd > /dev/null
notify-send "Nix Rebuild" "Nix flake rebuild has completed."
)'

alias ,nix-store='(
selected_option="/nix/store/$(ls /nix/store/ | fzf)"
if [ -n "$selected_option" ]; then
  # Copy the selected option to the clipboard using xclip
  echo -n "$selected_option" | xclip -selection clipboard
  echo "Copied $selected_option to clipboard"
fi
)'
