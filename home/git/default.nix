{ pkgs, ... }: {
  home.packages = with pkgs; [
    gh
    git-crypt
    git
    lazygit
  ];

  home.file = {
    ".config/lazygit/config.yml".source = ./lazygit-config.yml;
    ".config/git/config".source = ./config;
    ".config/git/template/hooks" = {
      source = ./hooks;
      recursive = true;
    };
  };

  # programs.git = {
  #   enable = true;
  #   userName = "YuriBocharov";
  #   userEmail = "quesadillaman@gmail.com";
  #
  #   extraConfig = {
  #     init = {
  #       defaultBranch = "main";
  #       templatedir = "~/.config/git/template";
  #     };
  #     pull.rebase = "true";
  #     color.ui = "auto";
  #   };
  #   hooks = {
  #     post-checkout = ./hooks/post-checkout;
  #     post-commit = ./hooks/post-commit;
  #     post-merge = ./hooks/post-merge;
  #     post-rewrite = ./hooks/post-rewrite;
  #     ctags = ./hooks/ctags;
  #   };
  # };
}
