{
  description = "Frost NixOS System Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sysc-greet = {
      url = "github:Nomadcxx/sysc-greet";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    nixos-hardware,
    home-manager,
    stylix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };

    mkHost = {
      hostname,
      system ? "x86_64-linux",
      extraModules ? [],
    }:
      nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs pkgs-stable;
        };

        modules =
          [
            ./hosts/${hostname}/configuration.nix
            inputs.sysc-greet.nixosModules.default
            inputs.nix-flatpak.nixosModules.nix-flatpak
            stylix.nixosModules.stylix

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                extraSpecialArgs = {inherit inputs pkgs-stable;};

                users = {
                  anton = import ./modules/anton.nix;
                  miraven = import ./modules/miraven.nix;
                };
              };
            }

            {
              programs.nh = {
                enable = true;
                clean = {
                  enable = true;
                  extraArgs = "--keep-since 4d --keep 3";
                };
                flake = "/etc/Frost";
              };
            }
          ]
          ++ extraModules;
      };
  in {
    nixosConfigurations = {
      desktop = mkHost {
        hostname = "desktop";
        extraModules = [
          nixos-hardware.nixosModules.common-cpu-amd
          nixos-hardware.nixosModules.common-gpu-amd
        ];
      };

      laptop = mkHost {
        hostname = "laptop";
        extraModules = [
          nixos-hardware.nixosModules.common-pc-laptop
        ];
      };
    };

    formatter.${system} = pkgs.alejandra;

    devShells.${system}.default = pkgs.mkShell {
      name = "Frost-dev-shell";
      packages = with pkgs; [
        alejandra
        deadnix
        git
        nh
        statix
      ];
    };
  };
}
