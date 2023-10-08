{ pkgs, ... }: {
  imports = [
    ../dev/ruby.nix
    ../dev/rust.nix
    ../dev/lua.nix
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  home = {
    file.".config/nvim" = {
      source = ./config;
      # copy the scripts directory recursively
      recursive = true;
    };
    file.".config/nvim/scipts" = {
      source = ./scripts;
      # copy the scripts directory recursively
      recursive = true;
    };

    packages = with pkgs; [
      stylua
    ];
  };
}
