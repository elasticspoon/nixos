{
  pkgs,
  config,
  ...
}: {

  # wallpaper, binary file
  home.file = {
    ".config/i3/config".source = ./config;
    ".config/i3/scripts/tmux-session.sh".source = ./scripts/tmux-session.sh;
    ".config/i3/scripts/tmux-session.sh".executable = true;

    # ".config/i3/scripts" = {
      # source = ./scripts;
      # # copy the scripts directory recursively
      # recursive = true;
      # executable = true; # make all scripts executable
    # };
  };
}
