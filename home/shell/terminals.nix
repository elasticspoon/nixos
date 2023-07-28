{
  ...
}:
{
  programs.kitty = {
    enable = true;
    theme = "Tokyo Night";
    font = {
      name = "JetBrainsMono Nerd Font";
      # use different font size on macOS
      size = 12;
    };

    settings =
      {
        scrollback_lines = 10000;
        enable_audio_bell = false;
      };
  };

  home.sessionVariables = {
    TERMINAL = "kitty";
  };
}
