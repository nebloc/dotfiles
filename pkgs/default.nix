{
  pkgs ? import <nixpkgs> { },
}:
{
  # nfi = pkgs.callPackage (pkgs.fetchFromGithub {
  #   owner = "nebloc";
  #   repo = "nfi";
  #   rev = "latest";
  #   sha256 = "22b8de503226261a053f22b9a632c672ffd7c7161be1e0b79c791bf368fb708c";
  # }) {};
}
