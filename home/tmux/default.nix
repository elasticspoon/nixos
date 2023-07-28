{
  pkgs,
  config,
  ...
}: {
  imports = [
    ../programs/fzf.nix
  ];

  programs.tmux.enable = true;

  home.file = {
    ".tmux.conf".source = ./config;
    ".config/tmux/statusline.conf".source = ./statusline.conf;
    ".config/tmux/tmux-cht-command".source = ./tmux-cht-command;
    ".config/tmux/tmux-cht-languages".source = ./tmux-cht-languages;

    ".config/tmux/scripts" = {
      source = ./scripts;
      # copy the scripts directory recursively
      recursive = true;
    };
  };


}
