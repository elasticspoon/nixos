{ ... }: {
  programs.kitty = {
    enable = true;
    theme = "Tokyo Night";
    font = {
      # name = "JetBrainsMono Nerd Font";
      name = "Ubuntu Mono Nerd Font";
      # use different font size on macOS
      size = 13;
    };

    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
    };
  };

  home.sessionVariables = {
    TERMINAL = "kitty";
  };
}
