{ inputs, outputs, ... }: {
    imports = [
        ./bspwm.nix
        ./kitty.nix
        ./rofi.nix
        ./sxhkd.nix
    ];
}