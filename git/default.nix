{ pkgs, ... }: {
  home.packages = with pkgs; [
    gh
    git-crypt
    git
    lazygit

    shellcheck # not actually git related
  ];
}
