{
  description = "Config NixOS de shadow : ThinkPad (travail) + PC maison";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations = {
      thinkpad = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/commun
          ./hosts/thinkpad
        ];
      };
    };
  };
}
