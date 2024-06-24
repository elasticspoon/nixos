{ pkgs, ... }: {
  systemd.user.services."notify-failure@" = {
    Unit = {
      Description = "Send a Dunst notification when a service fails";
    };
    Service = {
      # Note the single qoutes '' before ${} to escape the $ for the shell
      ExecStart = ''${pkgs.bash}/bin/sh "''${HOME}/.config/systemd/user/scripts/notify-service-failure.sh" %i critical'';
      Type = "oneshot";
    };
  };
}
