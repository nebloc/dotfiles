{
  pkgs,
  modulesPath,
  inputs,
  ...
}:
{
  imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-graphical-gnome.nix") ];
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  environment.systemPackages = with pkgs; [
    inputs.nixvim-flake.packages.${system}.default
    ripgrep
    git
    tree
  ];
}
