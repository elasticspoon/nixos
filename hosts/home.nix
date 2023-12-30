#
#  General Home-manager configuration
#
#  flake.nix
#   ├─ ./hosts
#   │   └─ home.nix *
#   └─ ./modules
#       ├─ ./programs
#       │   └─ default.nix
#       └─ ./services
#           └─ default.nix
#
{ config
, pkgs
, user
, ...
}: {
  imports = [
    ../home/i3
    ../home/tmux
    ../home/shell
    ../home/nvim
    ../home/git

    # Languages
    ../home/dev/javascript.nix
    ../home/dev/ruby.nix
    ../home/dev/nix.nix
    ../home/dev/go.nix

    # Programs
    # ../home/programs/alacritty.nix

    # Services
  ]; # Home Manager Modules

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      ripgrep
      coreutils
      fd
      tree

      # Libraries
      vips
      glib

      # Terminal
      # ranger # File Manager
      tldr # Helper

      # Video/Audio
      # feh               # Image Viewer
      # mpv               # Media Player
      pulseaudio
      pavucontrol # Audio Control
      #plex-media-player # Media Player
      # vlc               # Media Player
      # stremio           # Media Streamer

      # Apps
      # appimage-run      # Runs AppImages on NixOS
      # remmina           # XRDP & VNC Client

      # File Management
      # gnome.file-roller # Archive Manager
      # okular            # PDF Viewer
      # p7zip             # Zip Encryption
      # rsync             # Syncer - $ rsync -r dir1/ dir2/
      unzip # Zip Files
      # unrar             # Rar Files
      zip # Zip

      # General configuration
      #git              # Repositories
      #killall          # Stop Applications
      #nano             # Text Editor
      #pciutils         # Computer Utility Info
      #pipewire         # Sound
      #usbutils         # USB Utility Info
      #wacomtablet      # Wacom Tablet
      #wget             # Downloader
      #thunar           # File Manager
      #zsh              # Shell
      #
      # General home-manager
      #alacritty        # Terminal Emulator
      # dunst # Notifications
      #doom emacs       # Text Editor
      # libnotify # Dependency for Dunst
      #neovim           # Text Editor
      # rofi             # Menu
      #rofi-power-menu  # Power Menu
      #udiskie          # Auto Mounting
      #vim              # Text Editor
      #
      # Xorg configuration
      xclip # Console Clipboard
      xorg.xev # Input Viewer
      xorg.xkill # Kill Applications
      #xorg.xrandr      # Screen Settings
      #xterm            # Terminal
      #
      # Xorg home-manager
      flameshot # Screenshot
      #picom            # Compositer
      #sxhkd            # Shortcuts
      #
      # Wayland configuration
      #autotiling       # Tiling Script
      #grim             # Image Grabber
      #slurp            # Region Selector
      #swappy           # Screenshot Editor
      #swayidle         # Idle Management Daemon
      #wev              # Input Viewer
      #wl-clipboard     # Console Clipboard
      #wlr-randr        # Screen Settings
      #xwayland         # X for Wayland
      #
      # Wayland home-manager
      #mpvpaper         # Video Wallpaper
      #pamixer          # Pulse Audio Mixer
      #swaybg           # Background
      #swaylock-fancy   # Screen Locker
      #waybar           # Bar
      #
      # Desktop
      #ansible          # Automation
      #blueman          # Bluetooth
      #deluge           # Torrents
      #discord          # Chat
      #ffmpeg           # Video Support (dslr)
      #gmtp             # Mount MTP (GoPro)
      #gphoto2          # Digital Photography
      #handbrake        # Encoder
      #heroic           # Game Launcher
      #hugo             # Static Website Builder
      #lutris           # Game Launcher
      #mkvtoolnix       # Matroska Tool
      #nvtop            # Videocard Top
      #plex-media-player# Media Player
      #prismlauncher    # MC Launcher
      #steam            # Games
      #simple-scan      # Scanning
      #sshpass          # Ansible dependency
      #
      # Laptop
      #cbatticon        # Battery Notifications
      #blueman          # Bluetooth
      #light            # Display Brightness
      #libreoffice      # Office Tools
      #simple-scan      # Scanning
      #
      # Flatpak
      #obs-studio       # Recording/Live Streaming

      # wrk # HTTP Benchmarking
      k6 # HTTP Benchmarking
    ];

    # file.".config/wall".source = ../modules/themes/wall;
    # file.".config/wall.mp4".source = ../modules/themes/wall.mp4;
    # pointerCursor = {                         # This will set cursor system-wide so applications can not choose their own
    #   gtk.enable = true;
    #   name = "Dracula-cursors";
    #   #name = "Catppuccin-Mocha-Dark-Cursors";
    #   package = pkgs.dracula-theme;
    #   #package = pkgs.catppuccin-cursors.mochaDark;
    #   size = 16;
    # };
    stateVersion = "22.05";
  };

  programs = {
    home-manager.enable = true;

    bat = {
      enable = true;
      config = {
        pager = "less -FR";
        theme = "Catppuccin-mocha";
      };
      themes = {
        Catppuccin-mocha = builtins.readFile (pkgs.fetchurl {
          url = "https://raw.githubusercontent.com/catppuccin/bat/main/Catppuccin-mocha.tmTheme";
          hash = "sha256-qMQNJGZImmjrqzy7IiEkY5IhvPAMZpq0W6skLLsng/w=";
        });
      };
    };

    btop.enable = true; # replacement of htop/nmon
    # exa.enable = true; # A modern replacement for ‘ls’
    jq.enable = true; # A lightweight and flexible command-line JSON processor
    aria2.enable = true;
    gpg.enable = true;

    ssh = {
      enable = true;

      extraConfig = builtins.readFile ../.secrets/ssh.config;
    };
  };

  services = {
    gpg-agent = {
      enable = true;
      pinentryFlavor = "qt";
    };
  };

  xsession.enable = true; # Otherwise homesession vars break

  # gtk = {                                     # Theming
  #   enable = true;
  #   theme = {
  #     name = "Dracula";
  #     #name = "Catppuccin-Mocha-Compact-Mauve-Dark";
  #     package = pkgs.dracula-theme;
  #     #package = pkgs.catppuccin-gtk.override {
  #     #  accents = ["mauve"];
  #     #  size = "compact";
  #     #  variant = "mocha";
  #     #};
  #   };
  #   iconTheme = {
  #     name = "Papirus-Dark";
  #     package = pkgs.papirus-icon-theme;
  #   };
  #   font = {
  #     #name = "JetBrains Mono Medium";
  #     name = "FiraCode Nerd Font Mono Medium";
  #   };                                        # Cursor is declared under home.pointerCursor
  # };

  # systemd.user.targets.tray = {               # Tray.target can not be found when xsession is not enabled. This fixes the issue.
  #   Unit = {
  #     Description = "Home Manager System Tray";
  #     Requires = [ "graphical-session-pre.target" ];
  #   };
  # };
}
