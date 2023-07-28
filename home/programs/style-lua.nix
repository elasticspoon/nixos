{
  pkgs,
  ...
}: {
  imports = [
    ../dev/rust.nix
  ];
  home.packages = with pkgs; [
    stylua
  ];
}
