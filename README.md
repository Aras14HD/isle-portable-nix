This is a nix package for [isle-portable](https://github.com/isledecomp/isle-portable) on the current (planned to update at least weekly) dev version.
## Usage
If you use flakes, you can build it with `nix build github:Aras14HD/isle-portable-nix` and run the isle binary directly with `nix run github:Aras14HD/isle-portable-nix` and `nix run github:Aras14HD/isle-portable-nix#config` to configure.

## Alternatives
There is a better (though non-flake) version (not done as their first package, has options and better platform support) by RossSmyth as a nixpkgs pull here: https://github.com/NixOS/nixpkgs/pull/419421
