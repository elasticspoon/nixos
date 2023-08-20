{ pkgs, ... }: {
  home.packages = with pkgs; [
    gh
    git-crypt
  ];

  programs.git = {
    enable = true;
    userName = "YuriBocharov";
    userEmail = "quesadillaman@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = "true";
      color.ui = "auto";
    };
  };
}
