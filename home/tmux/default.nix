{ pkgs, ... }: {
  imports = [
    ../programs/fzf.nix
  ];

  programs.tmux = {
    enable = true;
    tmuxinator.enable = true;

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
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = "set -g @continuum-restore 'on'";
      }
    ];

    extraConfig = builtins.readFile ./config;
  };

  home.file = {
    # ".tmux.conf".source = ./config;
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
