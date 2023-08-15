{ pkgs
, config
, ...
}: {
  imports = [
    ../dev/rust.nix
  ];

  programs = { };

  home.packages = with pkgs; [
    lua-language-server
  ];
}
