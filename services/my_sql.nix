{ user
, pkgs
, ...
}: {
  services.mysql = {
    enable = true;
    # user = "${user}";
    package = pkgs.mysql;
    # https://github.com/NixOS/nixpkgs/issues/100177#issuecomment-783558934
    #  comment out any ensureUsers and ensureDatabases
    #  then switch to the new config
    #  run sudo mysql -u root and paste the commands from above:

    # MariaDB [(none)]> CREATE USER IF NOT EXISTS 'mysql'@'localhost' identified with unix_socket;
    # MariaDB [(none)]> GRANT ALL PRIVILEGES ON *.* TO 'mysql'@'localhost' WITH GRANT OPTION;
    # Then it's safe to uncomment the ensureUsers and ensureDatabases attributes and rebuild and mysql should start.
    # Afterswards you can run ALTER USER 'user'@'localhost' IDENTIFIED BY 'password'; to change password.
    ensureUsers = [
      {
        name = user;
        ensurePermissions = {
          "*.*" = "ALL PRIVILEGES";
        };
      }
    ];
  };
}
