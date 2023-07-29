{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    nodejs
    nodePackages.npm
    nodePackages.pnpm
    yarn
  ];

}
