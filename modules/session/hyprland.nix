{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;

  environment.systemPackages = with pkgs; [
    kitty
    rofi
    waybar
    dunst
    swaybg
    grim
    slurp
    wl-clipboard
    xdg-desktop-portal-hyprland
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
