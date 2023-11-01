#
#  These are the different profiles that can be used when building NixOS.
#
#  flake.nix
#   └─ ./hosts
#       ├─ default.nix *
#       ├─ configuration.nix
#       ├─ home.nix
#       └─ ./desktop OR ./laptop OR ./work OR ./vm
#            ├─ ./default.nix
#            └─ ./home.nix
#
{ inputs
, nixpkgs
, nixpkgs-unstable
, home-manager
, nur
, user
, dslr
, ...
}:
let
  system = "x86_64-linux"; # System architecture

  # pkgs = import nixpkgs {
  #   inherit system;
  #   config.allowUnfree = true;                              # Allow proprietary software
  # };

  unstable = import nixpkgs-unstable {
    inherit system;
    config.allowUnfree = true; # Allow proprietary software
  };

  fix = import dslr {
    inherit system;
    config.allowUnfree = true; # Allow proprietary software
  };

  lib = nixpkgs.lib;
in
{
  nixos-desktop = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs unstable system user fix;
    }; # Pass flake variable

    modules = [
      ./nixos-desktop

      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;

        home-manager.extraSpecialArgs = inputs;
        home-manager.users.bandito = import ../home;
      }
    ];
  };

  nixos-vbox = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs unstable system user fix;
      host = {
        hostName = "nixos-vbox";
        #   mainMonitor = "HDMI-A-1";
        #   secondMonitor = "HDMI-A-2";
      };
    }; # Pass flake variable
    modules = [
      # Modules that are used.
      nur.nixosModules.nur
      # hyprland.nixosModules.default
      ./nixos-vbox
      ./configuration.nix

      home-manager.nixosModules.home-manager
      {
        # Home-Manager module that is used.
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit unstable user fix;
          host = {
            hostName = "nixos-vboxx"; #For Xorg iGPU  | Hyprland iGPU
            #   mainMonitor = "HDMI-A-1";   #HDMIA3         | HDMI-A-3
            #   secondMonitor = "HDMI-A-2"; #DP1            | DP-1
          };
        }; # Pass flake variable
        home-manager.users.${user} = {
          imports = [
            ./home.nix
            ./nixos-vbox/home.nix
          ];
        };
      }
    ];
  };
  # nixos-vbox = lib.nixosSystem {
  #   system = "x86_64-linux";
  #
  #   modules = [
  #     ./nixos-vbox
  #
  #     home-manager.nixosModules.home-manager
  #     {
  #       home-manager.useGlobalPkgs = true;
  #       home-manager.useUserPackages = true;
  #
  #       home-manager.extraSpecialArgs = inputs;
  #       home-manager.users.bandito = import ../home;
  #     }
  #   ];
  # };
  # vm = lib.nixosSystem {                                    # VM profile
  #   inherit system;
  #   specialArgs = {
  #     inherit unstable inputs user location;
  #     host = {
  #       hostName = "vm";
  #       mainMonitor = "Virtual-1";
  #     };
  #   };
  #   modules = [
  #     ./vm
  #     ./configuration.nix
  #
  #     home-manager.nixosModules.home-manager {
  #       home-manager.useGlobalPkgs = true;
  #       home-manager.useUserPackages = true;
  #       home-manager.extraSpecialArgs = {
  #         inherit unstable user;
  #         host = {
  #           hostName = "vm";
  #           mainMonitor = "Virtual-1";
  #         };
  #       };
  #       home-manager.users.${user} = {
  #         imports = [(import ./home.nix)] ++ [(import ./vm/home.nix)];
  #       };
  #     }
  #   ];
  # };

  laptop = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs unstable system user fix;
      host = {
        hostName = "laptop";
        #   mainMonitor = "HDMI-A-1";
        #   secondMonitor = "HDMI-A-2";
      };
    }; # Pass flake variable
    modules = [
      # Modules that are used.
      nur.nixosModules.nur
      # hyprland.nixosModules.default
      ./laptop
      ./configuration.nix

      home-manager.nixosModules.home-manager
      {
        # Home-Manager module that is used.
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit unstable user fix;
          host = {
            hostName = "desktop"; #For Xorg iGPU  | Hyprland iGPU
            #   mainMonitor = "HDMI-A-1";   #HDMIA3         | HDMI-A-3
            #   secondMonitor = "HDMI-A-2"; #DP1            | DP-1
          };
        }; # Pass flake variable
        home-manager.users.${user} = {
          imports = [
            ./home.nix
            ./laptop/home.nix
          ];
        };
      }
    ];
  };
  desktop = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs unstable system user fix;
      host = {
        hostName = "desktop";
        #   mainMonitor = "HDMI-A-1";
        #   secondMonitor = "HDMI-A-2";
      };
    }; # Pass flake variable
    modules = [
      # Modules that are used.
      nur.nixosModules.nur
      # hyprland.nixosModules.default
      ./desktop
      ./configuration.nix

      home-manager.nixosModules.home-manager
      {
        # Home-Manager module that is used.
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit unstable user fix;
          host = {
            hostName = "desktop"; #For Xorg iGPU  | Hyprland iGPU
            #   mainMonitor = "HDMI-A-1";   #HDMIA3         | HDMI-A-3
            #   secondMonitor = "HDMI-A-2"; #DP1            | DP-1
          };
        }; # Pass flake variable
        home-manager.users.${user} = {
          imports = [
            ./home.nix
            ./desktop/home.nix
          ];
        };
      }
    ];
  };
}
