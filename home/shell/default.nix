{ config, ...}: let
  # d = config.xdg.dataHome;
  # c = config.xdg.configHome;
  # cache = config.xdg.cacheHome;
in {
  imports = [
    # ./common.nix
    ./terminals.nix
    ./shell.nix
  ];

  # add environment variables
  home.sessionVariables = {
    # # clean up ~
    # LESSHISTFILE = cache + "/less/history";
    # LESSKEY = c + "/less/lesskey";
    # WINEPREFIX = d + "/wine";
    # XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority";

    # set default applications
    EDITOR = "vim";
    BROWSER = "firefox";
    TERMINAL = "kitty";

    # enable scrolling in git diff
    DELTA_PAGER = "less -R";

    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
  };

  # home.shellAliases = {
  #   k = "kubectl";
  # };
}
