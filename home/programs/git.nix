{
  pkgs,
  ...
}: {
  home.packages = [pkgs.gh];

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
