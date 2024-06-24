{
  pkgs,
  config,
  ...
}: {
  programs = {
    chromium = {
      enable = true;
      extensions = [
      ];
    };

    firefox = {
      enable = true;

      profiles.default = {
        id = 0;
        name = "default";
        isDefault = true;
      };
    };
  };
}
