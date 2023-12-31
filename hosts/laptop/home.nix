#
#  Home-manager configuration for desktop
#
#  flake.nix
#   ├─ ./hosts
#   │   └─ ./desktop
#   │       └─ ./home.nix
#   └─ ./modules
#       └─ ./desktop
#           └─ ./hyprland
#               └─ home.nix
#
{ pkgs, ... }: {
  imports = [
    # Programs
    ../../home/programs
    ../../home/programs/ranger.nix

    # Services
    ../../home/services/ping-projects.nix
    ../../home/services/dunst.nix
  ];

  xfconf.settings = {
    xfce4-session = {
      "general/LockCommand" = "i3lock -c 000000";
    };
  };

  home = {
    # Specific packages for desktop
    packages = with pkgs; [
      #     # Applications
      #     ansible           # Automation
      #     sshpass           # Ansible Dependency
      #     hugo              # Static Website Builder
      #     plex-media-player # Media Player
      #     nvtop
      #
      #     # Dependencies
      #     gmtp              # Used for mounting gopro
      #     ispell            # Emacs spelling
      #
      discord # Comms           # See overlay default.nix
      vlc # Media Player
      mupdf # PDF Reader
      btop # System Monitor
      # spotify
      #     #ffmpeg           # Video Support
      #     #gphoto2          # Digital Photography
      #     #steam            # Game Launcher
      #
      #     # Packages I used in the past
      #     #darktable        # Raw Image Processing
      gimp # Graphical Editor
      #     #inkscape         # Vector Graphical Editor
      #     #kdenlive         # Video Editor
      libreoffice # Office Packages
      #     #shotcut          # Video Editor
      obsidian
      qbittorrent
    ];
  };
}
