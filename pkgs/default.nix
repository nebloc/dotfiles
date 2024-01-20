{ pkgs ? import <nixpkgs> { } }: rec {
  azuredatastudio_local = pkgs.callPackage ./azuredatastudio { };
}