{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs = { self, nixpkgs, nixos-hardware, ... }: 

    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ 
                ./configuration.nix
                nixos-hardware.nixosModules.lenovo-thinkpad-t495 
                ];
      };
  };
 
}
