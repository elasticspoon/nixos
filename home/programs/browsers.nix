{
  pkgs,
  config,
  nur,
  ...
}: {
  programs = {
    chromium = {
      enable = true;
      extensions = [
        # {id = "";}  // extension id, query from chrome web store
      ];
    };

    firefox = {
      enable = true;

      profiles.default = {
        id = 0;
        name = "bandito";
        isDefault = true;

        extraConfig = ''
          user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
      '';
      };
    };
  };

  home.file.".mozilla/firefox/bandito/chrome/userChrome.css".source = ./userChrome.css;
  home.file.".mozilla/firefox/bandito/chrome/userContent.css".source = ./userContent.css;
}
