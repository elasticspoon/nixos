{ pkgs, ... }: {
  # i3 related options
  # environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw
  services.xserver = {
    enable = true;
    videoDrivers = [  ];
    # deviceSection = ''Option "TearFree" "true"'';

    desktopManager.xfce.enable = true;
    displayManager = {
      defaultSession = "none+i3";
      lightdm.enable = true;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        # rofi          # application launcher, the same as dmenu
        # dunst         # notification daemon
        dmenu
        alsa-utils
        # i3blocks # status bar
        i3lock # default i3 screen locker
        # xautolock     # lock screen after some time
        i3status # provide information to i3bar
        # i3status-rust # provide information to i3bar
        # i3-gaps       # i3 with gaps
        # picom         # transparency and shadows
        feh # set wallpaper
        # acpi          # battery information
        arandr # screen layout manager
        dex # autostart applications
        xbindkeys # bind keys to commands
        xorg.xbacklight # control screen brightness
        # xorg.xdpyinfo      # get screen information
        # sysstat # get system informationmod
      ];
    };

    # Configure keymap in X11
    layout = "us";
    xkbVariant = "";
  };

  services.picom = {
    enable = true;
    vSync = true;
  };

  # services.xserver.enable = true;

  # services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.desktopManager.xfce.enable = true;
  # services.xserver.windowManager.i3.enable = true;

  # thunar file manager(part of xfce) related options
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
}
