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

  xdg.configFile = {
    "gtk-3.0/settings.ini".force = true;
    "gtk-4.0/settings.ini".force = true;
  };
}
