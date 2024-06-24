{ ... }: {
  home.services.postgresql = {
    enable = true;
    ensureUsers = [
      {
        name = "bandito";
        ensureClauses = {
          superuser = true;
          createdb = true;
          createrole = true;
        };
      }
    ];
  };
}
