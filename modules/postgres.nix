{ user, ... }: {
  services.postgresql = {
    enable = true;
    ensureUsers = [
      {
        name = "${user}";
        ensureClauses = {
          superuser = true;
          createdb = true;
          createrole = true;
        };
      }
    ];
  };
}
