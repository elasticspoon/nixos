{
  description = "NixOS Config";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://cache.nixos.org/"
    ];

    # nix community's cache server
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable"; # Unstable Nix Packages
    dslr.url = "github:nixos/nixpkgs/nixos-22.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR"; # Add "nur.nixosModules.nur" to the host modules NUR Packages
  };

  outputs =
    inputs @ { nixpkgs
    , nixpkgs-unstable
    , home-manager
    , nur
    , dslr
    , ...
    }:
    let
      user = "bandito";
    in
    {
      nixosConfigurations = (
        import ./hosts {
          inherit (nixpkgs) lib;
          # Also inherit home-manager so it does not need to be defined here.
          inherit inputs nixpkgs nixpkgs-unstable home-manager nur user dslr;
        }
      );
    };
}
