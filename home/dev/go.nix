{ pkgs, ... }: {
  home.file = { };

  home.packages = with pkgs; [
    gofumpt
    goimports-reviser
  ];

  programs.go = {
    enable = true;
    packages = { };
  };
}
