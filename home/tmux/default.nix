{
  pkgs,
  config,
  ...
}: {
  programs.tmux = {
    enable = true;
  };

  home.file.".tmux.conf".source = ./config;
  home.file.".config/tmux/scripts" = {
    source = ./scripts;
    # copy the scripts directory recursively
    recursive = true;
    executable = true;  # make all scripts executable
  };
}
