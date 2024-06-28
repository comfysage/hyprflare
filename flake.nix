{
  description = "hyprflare";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      inherit (nixpkgs) lib;

      forAllSystems =
        function:
        nixpkgs.lib.genAttrs lib.systems.flakeExposed (system: function nixpkgs.legacyPackages.${system});

      callAllPackages =
        pkgs:
        pkgs.lib.packagesFromDirectoryRecursive {
          inherit (pkgs) callPackage;
          directory = ./pkgs;
        };
    in
    {
      packages = forAllSystems callAllPackages;
      overlays.default = final: _: callAllPackages final;
    };
}
