{
  pkgs,
  config,
  ...
}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.lazygit.enable = true;

  home.file.".config/nvim" = {
    source = ./config;
    # copy the scripts directory recursively
    recursive = true;
  };
}
