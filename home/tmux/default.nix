{ pkgs, ... }: {
  imports = [
    ../programs/fzf.nix
  ];

  programs.tmux = {
    enable = true;

    plugins = with pkgs; [
      {
        # https://github.com/tmux-plugins/tmux-resurrect
        # Manually persists tmux environment across system restarts.
        #   prefix + Ctrl-s - save
        #   prefix + Ctrl-r - restore
        plugin = tmuxPlugins.resurrect;
        # Restore Neovim sessions
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      tmuxPlugins.open
      tmuxPlugins.continuum
    ];

    extraConfig = builtins.readFile ./config;
  };

  home.file = {
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
