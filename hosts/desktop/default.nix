#
#  Specific system configuration settings for desktop
#
#  flake.nix
#   ├─ ./hosts
#   │   └─ ./desktop
#   │        ├─ default.nix *
#   │        └─ hardware-configuration.nix
#   └─ ./modules
#       ├─ ./desktop
#       │   ├─ ./hyprland
#       │   │   └─ default.nix
#       │   └─ ./virtualisation
#       │       └─ default.nix
#       ├─ ./programs
#       │   └─ games.nix
#       └─ ./hardware
#           └─ default.nix
#
{ pkgs, ... }: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/syncthing.nix
  ];

  boot.loader = {
    systemd-boot.enable = false;

    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot";

    grub = {
      enable = true;
      efiSupport = true;
      devices = [ "nodev" ];
      useOSProber = true;
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "desktop"; # Define your hostname.

  # hardware = {
  #   sane = {                                    # Used for scanning with Xsane
  #     enable = true;
  #     extraBackends = [ pkgs.sane-airscan ];
  #   };
  #   opengl = {
  #     enable = true;
  #     extraPackages = with pkgs; [
  #       #intel-media-driver                     # iGPU
  #       #vaapiIntel
  #     #  rocm-opencl-icd                         # AMD
  #     #  rocm-opencl-runtime
  #     amdvlk
  #     ];
  #     extraPackages32 = with pkgs; [
  #       driversi686Linux.amdvlk
  #     ];
  #     driSupport = true;
  #     driSupport32Bit = true;
  #   };
  # };

  environment = {
    # Packages installed system wide
    # variables = {
    #   TERMINAL = "kitty";
    # };
    sessionVariables = {
      MONITOR = "1080+1440";
    };

    systemPackages = with pkgs; [
      # This is because some options need to be configured.
      discord
      pmutils
      # plex
      # simple-scan
      # x11vnc
      # wacomtablet
      # clinfo
    ];
    # variables = {
    #  LIBVA_DRIVER_NAME = "i965";
    # };
  };

  services = {
    # blueman.enable = true;                      # Bluetooth
    # samba = {                                   # File Sharing over local network
    #   enable = true;                            # Don't forget to set a password:  $ smbpasswd -a <user>
    #   shares = {
    #     share = {
    #       "path" = "/home/${user}";
    #       "guest ok" = "yes";
    #       "read only" = "no";
    #     };
    #   };
    #   openFirewall = true;
    # };
  };

  nixpkgs.overlays = [
    # This overlay will pull the latest version of Discord
    (self: super: {
      discord = super.discord.overrideAttrs (
        _: {
          src = builtins.fetchTarball {
            url = "https://discord.com/api/download?platform=linux&format=tar.gz";
            sha256 = "0pml1x6pzmdp6h19257by1x5b25smi2y60l1z40mi58aimdp59ss";
          };
        }
      );
    })
  ];
}
