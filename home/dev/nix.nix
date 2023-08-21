{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      # Nvim Linters, Etc.
      statix
      nix-init
      deadnix
      alejandra
      nixpkgs-fmt
    ];
  };
}
