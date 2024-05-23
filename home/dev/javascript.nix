{ pkgs, ... }: {
  home.packages = with pkgs; [
    yarn
    nodejs
    typescript
    nodePackages.npm
    nodePackages.pnpm
    nodePackages.node2nix
    nodePackages.vsc-leetcode-cli
    nodePackages.live-server
  ];
}
