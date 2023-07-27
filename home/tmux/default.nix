{
  pkgs,
  config,
  ...
}: {
  programs.tmux = {
    enable = true;
  };

  home.file.".tmux.conf".source = ./config;
  home.file.".config/tmux/statusline.conf".source = ./statusline.conf;
  home.file.".config/tmux/tmux-cht-command".source = ./tmux-cht-command;
  home.file.".config/tmux/tmux-cht-languages".source = ./tmux-cht-languages;
  home.file.".config/tmux/scripts" = {
    source = ./scripts;
    # copy the scripts directory recursively
    recursive = true;
    executable = true;  # make all scripts executable
  };
}
