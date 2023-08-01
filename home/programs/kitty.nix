{ ... }: {
  programs.kitty = {
    enable = true;
    theme = "Tokyo Night";
    font = {
      name = "Ubuntu Mono Nerd Font";
      # use different font size on macOS
      size = 13;
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
