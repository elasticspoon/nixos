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

  home.file."make-scripts-executable.sh" = {
    executable = true; # Make the script itself executable
    text = ''
#!/usr/bin/env bash

# Change to the scripts directory
cd ~/.config/i3/scripts

# Find all files within the scripts directory and make them executable
find . -type f -exec chmod +x {} \;

    '';
  };
}
