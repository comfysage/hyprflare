{
  description = "hyprflare";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    forAllSystems = function:
      nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed (
        system: function nixpkgs.legacyPackages.${system}
      );
  in {
    packages = forAllSystems (pkgs: {
      batterynotify = pkgs.callPackage ./pkgs/batterynotify {};
      colorpicker = pkgs.callPackage ./pkgs/colorpicker {};
      playercontrol = pkgs.callPackage ./pkgs/playercontrol {};
      quickhist = pkgs.callPackage ./pkgs/quickhist {};
      volumecontrol = pkgs.callPackage ./pkgs/volumecontrol {};
      wallselect = pkgs.callPackage ./pkgs/wallselect {};
      wincreate = pkgs.callPackage ./pkgs/wincreate {};
    });

    overlays.default = self.packages;
  };
}
