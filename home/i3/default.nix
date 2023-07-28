{
  pkgs,
  config,
  ...
}: {

  # wallpaper, binary file
  home.file = {
    ".config/i3/config".source = ./config;
    # ".config/i3/scripts/tmux-session.sh".source = ./scripts/tmux-session.sh;
    # ".config/i3/scripts/tmux-session.sh".executable = true;

    ".config/i3/scripts" = {
      # source = ./scripts;
      recursive = true;
      executable = true;  # make all scripts executable
      text = ''
#!/usr/bin/env bash

# Get the name of the current i3 workspace
# WORKSPACE_NAME=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused).name')
WORKSPACE_NAME=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused).name')
SESSION_NAME="terminal-$WORKSPACE_NAME"
TERMINAL_DATA=$(i3-msg -t get_tree | jq '.. | select(.name? | tostring | startswith("'"$SESSION_NAME"'"))')
      ''
    };
  };



  # set cursor size and dpi for 4k monitor
  # xresources.properties = {
    # "Xcursor.size" = 16;
    # "Xft.dpi" = 192;
  # };
}
