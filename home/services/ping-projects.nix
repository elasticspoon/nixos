{ pkgs, ... }:
let
  keepAliveUrls = [
    "http://35.243.197.55"
    "https://flight-booker-gogr.onrender.com/"
  ];
  urlsList = builtins.concatStringsSep " " keepAliveUrls;
  pingUrlScript = ''''${HOME}/.config/systemd/user/scripts/ping-url-list.sh'';
in
{
  imports = [
    ./service-failure-notifcations.nix
  ];

  home.file.".config/systemd/user/scripts" = {
    source = ./scripts;
    recursive = true;
  };

  systemd.user.services.ping-projects = {
    Unit = {
      Description = "Ping URLS to keep projects alive";
      OnFailure = "notify-failure@%i.service";
      Wants = [ "network-online.target" ];
      After = [ "network-online.target" ];
    };
    Service = {
      # Note the single qoutes '' before ${} to escape the $ for the shell
      ExecStart = ''${pkgs.bash}/bin/sh ${pingUrlScript} ${urlsList}'';
    };
  };
}
