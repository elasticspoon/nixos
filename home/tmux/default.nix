{ pkgs
, config
, ...
}: {
  imports = [
    ../programs/fzf.nix
  ];

  programs.tmux = {
    enable = true;
    tmuxinator.enable = true;

    plugins = with pkgs.tmuxPlugins; [
      {
        # https://github.com/tmux-plugins/tmux-resurrect
        # Manually persists tmux environment across system restarts.
        #   prefix + Ctrl-s - save
        #   prefix + Ctrl-r - restore
        plugin = resurrect;
        # Restore Neovim sessions
        extraConfig = ''
          set -g @resurrect-processes '"~nvim -> ~/.config/bash/scripts/restore-nvim-session.sh"'
          set -g @resurrect-delete-backup-after 5
        '';
      }
      {
        plugin = tmux-thumbs;
        extraConfig = ''
          set -g @thumbs-key Space
          set -g @thumbs-command 'echo -n {} | xclip -sel clip && tmux display-message \"Copied {}\"'
        '';
      }
      # {
      #   plugin = tmuxPlugins.jump;
      #   extraConfig = ''
      #     set -g @jump-key 'j'
      #   '';
      # }
      fuzzback
      {
        extraConfig = ''
          set -g @continuum-restore 'on'
        '';
        plugin = continuum;
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

  systemd.user.services.tmux-autosave = {
    Unit = {
      Description = "Run tmux_resurrect save script every 15 minutes";
      OnFailure = "error@%n.service";
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/sh ${pkgs.tmuxPlugins.resurrect}/share/tmux-plugins/resurrect/scripts/save.sh quiet";
    };
  };
  #
  systemd.user.timers.tmux-autosave = {
    Unit = {
      Description = "Run tmux_resurrect save script every 15 minutes";
    };
    Timer = {
      OnBootSec = "5min";
      OnUnitActiveSec = "15min";
      Unit = "tmux-autosave.service";
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}
