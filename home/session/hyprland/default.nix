{ config, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./kitty.nix
    ./rofi.nix
    ./waybar.nix
    ./dunst.nix
    ./packages.nix
  ];
}
