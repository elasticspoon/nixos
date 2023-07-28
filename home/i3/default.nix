{
  pkgs,
  config,
  ...
}: {

  # wallpaper, binary file
  home.file = {
    ".config/i3/config".source = ./config;

    ".config/i3/scripts" = {
      source = ./scripts;
      # copy the scripts directory recursively
      recursive = true;
    };
  };
}
