{
  pkgs,
  config,
  ...
}: {
  programs.tmux.enable = true;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };

  home.file = {

    ".tmux.conf".source = ./config;
    ".config/tmux/statusline.conf".source = ./statusline.conf;
    ".config/tmux/tmux-cht-command".source = ./tmux-cht-command;
    ".config/tmux/tmux-cht-languages".source = ./tmux-cht-languages;

    ".config/tmux/scripts/tmux-sessionizer".source = ./scripts/tmux-sessionizer;
    ".config/tmux/scripts/tmux-sessionizer".executable = true;

    ".config/tmux/scripts/tmux-windowizer".source = ./scripts/tmux-windowizer;
    ".config/tmux/scripts/tmux-windowizer".executable = true;

    ".config/tmux/scripts/tmux-cht.sh".source = ./scripts/tmux-cht.sh;
    ".config/tmux/scripts/tmux-cht.sh".executable = true;
  };


  # home.file.".config/tmux/scripts" = {
    # source = ./scripts;
    # # copy the scripts directory recursively
    # recursive = true;
    # executable = true;  # make all scripts executable
  # };
}
