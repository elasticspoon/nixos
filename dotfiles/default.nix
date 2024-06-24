{ pkgs, ... }: {
  home.file = {
    ".fonts".source = {
      source = ./fonts;
      recursive = true;
    };
    ".config".source = {
      source = ./config;
      recursive = true;
    };
    ".ssh".source = {
      source = ./ssh;
      recursive = true;
    };
    ".screenlayout".source = {
      source = ./screenlayout;
      recursive = true;
    };

    ".bashrc".source = ./bashrc;
    ".default-gems".source = ./default-gems;
    ".irbrc".source = ./irbrc;
    ".profile".source = ./profile;
    ".tool-versions".source = ./tool-versions;
    ".prettierrc.js".source = ./prettierrc.js;
    ".erb-lint.yml".source = ./erb-lint.yml;
    ".solargraph.yml".source = ./solargraph.yml;
  };
}
