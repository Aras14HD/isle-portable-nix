{
  description = "A package for the portable Lego Island decomp (dev release)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    # The set of systems to provide outputs for
    allSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

    # A function that provides a system-specific Nixpkgs for the desired systems
    forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
    });
  in {
    packages = forAllSystems ({ pkgs }: {
      default = pkgs.callPackage ./default.nix {};
    });
  };
}
