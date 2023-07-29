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
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";         # Unstable Nix Packages

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {                                                               # NUR Packages
      url = "github:nix-community/NUR";                                   # Add "nur.nixosModules.nur" to the host modules
    };
  };

  outputs = inputs @ {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nur,
      ...
  }: 
  let 
    user = "bandito";
  in
  {
    desktop = (
      import ./hosts {
        inherit (nixpkgs) lib;
        # Also inherit home-manager so it does not need to be defined here.
        inherit inputs nixpkgs nixpkgs-unstable home-manager nur user;
      }
    );

    nixosConfigurations = {
      nixos-vbox = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/nixos-vbox

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs;
            home-manager.users.bandito = import ./home;
          }
        ];
      };

      nixos-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/nixos-desktop

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs;
            home-manager.users.bandito = import ./home;
          }
        ];
      };
    };
  };
}
