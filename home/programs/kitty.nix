{ ... }: {
  programs.kitty = {
    enable = true;
    theme = "Tokyo Night";
    font = {
      name = "DejaVu Sans Mono";
      # use different font size on macOS
      size = 9;
    };

    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
    };
    shellIntegration = {
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };
  };

  home.sessionVariables = {
    TERMINAL = "kitty";
  };
}
