{ ... }: {
  # programs.bash = {
  #   enable = true;
  # };
  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  home.file = {
    ".bashrc".source = ./config/bashrc;
    ".profile".source = ./config/profile;

    ".config/bash/scripts" = {
      source = ./scripts;
      # copy the scripts directory recursively
      recursive = true;
    };
  };
}
