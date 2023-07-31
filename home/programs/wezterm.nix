{ ... }: {
  programs.wezterm = {
    enable = true;
    enableBashIntergration = true;
    enableZshIntegration = true;
    extraConfig = {
      local wezterm = require 'wezterm';
      font_size = 13.0;
      color_scheme = "Tokyo Night";
      font = wezterm.font "JetBrains Mono";
    };
  };

  home.sessionVariables = {
    TERMINAL = "wezterm";
  };
}
