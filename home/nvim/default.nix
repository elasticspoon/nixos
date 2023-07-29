{
  pkgs,
  config,
  ...
}: {
  
  imports = [
    ../dev/ruby.nix
    ../programs/lazygit.nix
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

    packages = with pkgs; [
      stylua
    ];
  };

}
