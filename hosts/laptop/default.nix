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
{ pkgs, user,  ... }: {
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/bluetooth.nix
      ../../modules/droidcam
    ]
    ++ (import ../../services);

  # Default UEFI setup
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # boot.loader = {
  #   systemd-boot.enable = false;
  #
  #   efi.canTouchEfiVariables = true;
  #   efi.efiSysMountPoint = "/boot";
  #
  #   grub = {
  #     enable = true;
  #     efiSupport = true;
  #     devices = [ "nodev" ];
  #     useOSProber = true;
  #   };
  # };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "laptop"; # Define your hostname.
  networking.networkmanager.enable = true;

  laptop.enable = true;
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
    # sessionVariables = {
    #   MONITOR = "1080+1440";
    # };

    systemPackages = with pkgs; [
      # This is because some options need to be configured.
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
  # virtualisation.virtualbox = {
  #   host = {
  #     enable = true;
  #     enableExtensionPack = true;
  #   };
  #   guest = {
  #     enable = true;
  #   };
  # };
  # users.extraGroups.vboxusers.members = [ "${user}" ];


  services = {
    logind = {
      lidSwitch = "suspend";
      extraConfig = ''
        IdleActionSec=15min
      '';
    };
    # acpid = {
    #   enable = true;
    #   lidEventCommands = ''
    #     export PATH=$PATH:/run/current-system/sw/bin
    #
    #     lid_state=$(cat /proc/acpi/button/lid/LID0/state | awk '{print $NF}')
    #     if [ $lid_state = "closed" ]; then
    #         i3lock -c 000000
    #         systemctl suspend
    #     fi
    #   '';
    #
    #   powerEventCommands = ''
    #     systemctl suspend
    #   '';
    # };

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

  programs = {
    nm-applet.enable = true;
    xss-lock.enable = true;
    xss-lock.lockerCommand = "${pkgs.i3lock}/bin/i3lock -c 000000";
  };

  nixpkgs.overlays = [
    # This overlay will pull the latest version of Discord
    (self: super: {
      discord = super.discord.overrideAttrs (
        _: {
          src = builtins.fetchTarball {
            url = "https://discord.com/api/download?platform=linux&format=tar.gz";
            sha256 = "1mm470lahyk0cz9zd6pfv7zhlvaw5gvqip68867lj2lw63r4zivx";
          };
        }
      );
    })
  ];
}
