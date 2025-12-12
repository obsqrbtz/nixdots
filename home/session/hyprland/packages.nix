{ config, pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "rose-pine";
  };

  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard
    cliphist
    xfce.thunar
    xfce.thunar-volman
    playerctl
    brightnessctl
    pavucontrol
    swaynotificationcenter
    swaybg
    networkmanagerapplet
    blueman
  ];
}
