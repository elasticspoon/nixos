{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      # Nvim Linters, Etc.
      statix
      deadnix
      alejandra
      nixpkgs-fmt
    ];
  };
}
