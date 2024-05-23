#
#  Main system configuration. More information available in configuration.nix(5) man page.
#
#  flake.nix
#   ├─ ./hosts
#   │   └─ configuration.nix *
#   └─ ./modules
#       ├─ ./editors
#       │   └─ default.nix
#       └─ ./shell
#           └─ default.nix
#
{ config
, pkgs
, inputs
, user
, ...
}: {
  imports = [
    ../modules/i3.nix
    ../modules/power.nix
    ../modules/options.nix
  ];

  users.users.${user} = {
    # System User
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "docker" "audio" "camera" "networkmanager" "lp" "scanner" "kvm" "libvirtd" "plex" ];
  };
  security.sudo.wheelNeedsPassword = false; # User does not need to give password when using sudo.

  time.timeZone = "America/New_York"; # Time zone and internationalisation

  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us"; # or us/azerty/etc
  };

  documentation.man.generateCaches = true;

  environment = {
    sessionVariables = {
      BROWSER = "firefox";
    };
  };

  #sound = {                                # Deprecated due to pipewire
  #  enable = true;
  #  mediaKeys = {
  #    enable = true;
  #  };
  #};

  security.rtkit.enable = true;
  security.polkit.enable = true;

  services = {
    pipewire = {
      # Sound
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };
  };


  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-design-icons

      # normal fonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      font-awesome

      # nerdfonts
      (nerdfonts.override { fonts = [ "UbuntuMono" ]; })

      dejavu_fonts
    ];

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
      monospace = [ "DejaVu Sans Mono" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
    systemPackages = with pkgs; [
      # Default packages installed system-wide
      vim
      git
      curl
      git
      gcc
      inetutils
    ];
  };

  programs = {
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
        thunar-media-tags-plugin
      ];
    };
  };

  nix = {
    # Nix Package Manager settings
    settings = {
      auto-optimise-store = true; # Optimise syslinks
    };
    gc = {
      # Automatic garbage collection
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
    package = pkgs.nixVersions.git; # Enable nixFlakes on system
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations      = true
    '';
  };

  nixpkgs.config = {
    allowUnfree = true; # Allow proprietary software.
    # done to allow obsidian to run
    permittedInsecurePackages = [
      "electron-25.9.0"
      "openssl-1.1.1w"
    ];
  };

  system = {
    # NixOS settings
    #autoUpgrade = {                         # Allow auto update (not useful in flakes)
    #  enable = true;
    #  channel = "https://nixos.org/channels/nixos-unstable";
    #};
    stateVersion = "23.05";
  };

  # Sound
  # sound.enable = true;
  # hardware.pulseaudio.enable = false;
}
