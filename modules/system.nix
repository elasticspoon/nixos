{ config, pkgs, ... }:

{
  # Adding Nix User Repository

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";


  # Enable CUPS to print documents.
  services.printing.enable = true;
  

  fonts = {
    fonts = with pkgs; [
      # icon fonts
      material-design-icons

      # normal fonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji

      # nerdfonts
      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
    ];

    # use fonts specified by user rather than default ones
    enableDefaultFonts = false;

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
      monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  # programs.dconf.enable = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Enable the OpenSSH daemon.
  # services.openssh = {
    # enable = true;
    # settings = {
      # X11Forwarding = true;
      # PermitRootLogin = "no";         # disable root login
      # PasswordAuthentication = false; # disable password login
    # };
    # openFirewall = true;
  # };


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    git
    # pinentry
    xfce.thunar  # xfce4's file manager
  ];

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;

  services = {
    # dbus.packages = [ pkgs.gcr ];
    # geoclue2.enable = true;
    # udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bandito = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    initialPassword = "password";
  };

  # system.autoUpgrade = {
    # enable = true;
    # allowReboot = true;
    # channel = "https://channels.nixos.org/nixos-unstable";
  # };
# 
  # nix.gc = {
    # automatic = true;
    # dates = "weekly";
    # options = "--delete-older-than 21d";
  # };
}
