{
  # pkgs,
  ...
}: {
  imports = [
    ../../home/programs/browsers.nix
  ];

  home = {
    # Specific packages for desktop
    # packages = with pkgs; [
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
    #     # Imported in default or from modules
    #     #discord          # Comms           # See overlay default.nix
    #     #ffmpeg           # Video Support
    #     #gphoto2          # Digital Photography
    #     #steam            # Game Launcher
    #
    #     # Packages I used in the past
    #     #darktable        # Raw Image Processing
    #     #gimp             # Graphical Editor
    #     #inkscape         # Vector Graphical Editor
    #     #kdenlive         # Video Editor
    #     #libreoffice      # Office Packages
    #     #shotcut          # Video Editor
    #   obsidian
    # ];
  };
}
