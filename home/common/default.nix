{ inputs, outputs, ... }: {
    imports = [
        ./bspwm.nix
        ./firefox.nix
        ./kitty.nix
        ./rofi.nix
        ./sxhkd.nix
        ./zsh.nix
        ./dunst.nix
    ];
}
