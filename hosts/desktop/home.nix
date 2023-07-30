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

{ pkgs, nur, ... }:

{
    imports = [
      ../../home/programs/browsers.nix
      ../../home/programs/syncthing.nix
    ];

  home = {                                # Specific packages for desktop
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
      obsidian
    ];
    

  };
  # services = {
  #   syncthing = {
  #     tray.enable = true;
  #     enable = true;
  #     extraOptions = [
  #       "-no-browser"
  #       "-home=/home/bandito/.config/syncthing"
  #     ];
  #   };
  # };

}
