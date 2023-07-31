{ ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        # Font - Laptop has size manually changed at home.nix
        normal.family = "JetBrainsMono Nerd Font";
        bold = { style = "Bold"; };
        #size = 8;
      };
      mouse.hide_when_typing = "_true_";
    };
  };
  home.sessionVariables = {
    TERMINAL = "alacritty";
  };
}
