{ pkgs, ... }: {
  home.packages = with pkgs; [
    nodejs
    nodePackages.npm
    nodePackages.pnpm
    yarn
    nodePackages.node2nix
  ];
}
