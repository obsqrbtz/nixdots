{ config, pkgs, inputs, ... }:

{
  imports = [
    ./home/common.nix

    ./home/session/gnome.nix
    ./home/session/hyprland.nix
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark"; # or "Adwaita" for light
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };
}
