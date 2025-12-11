{ config, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [ dmenu i3status i3lock i3blocks ];
      };
    };
    displayManager = { gdm.enable = true; };
  };

  environment.systemPackages = with pkgs; [
    alacritty
    rofi
    polybar
    picom
    feh
    scrot
    dunst
    xclip
  ];
}
